require 'csv'

class CSVDataImporter

  def initialize(ar_class, csv_file, results=[])
    @ar_class = ar_class
    @csv_file = csv_file
    @results = results
  end

  # Import in another thread
  def import!
    t = Thread.new do
      import_data
      ActiveRecord::Base.connection.close
    end
    at_exit { t.join }
  end

  private

    def import_data
      put_message "Table '#{@ar_class.to_s.tableize}' initial row count: #{@ar_class.count}"

      put_message "Importing #{@ar_class.table_human_name}...", time: true

      failed, updated, inserted, ignored, skipped = 0, 0, 0, 0, 0

      begin
        @ar_class.transaction do

          # Get a hash of all current unique keys to id
          current_keys = @ar_class.get_unique_keys_hash

          # Loop the CSV rows
          CSV.foreach(@csv_file, headers: true) do |row|

            # Swap NaN values for blanks
            row_hash = row.to_hash
            row_hash.map { |k,v| row_hash[k] = (v == 'NaN' ? '' : v) }

            # Remove protected attributes
            @ar_class.protected_attributes.each { |col| row_hash.delete(col) }

            # Report blank headings
            if $. == 2 && row_hash.keys.any? { |k| k.blank? }
              raise "You have a blank column heading :-("
            end

            # Jump to next row if blank
            if row_hash.blank?
              put_message "Row #{$.} skipped - empty row"
              skipped += 1
              next
            end

            # Create the AR object and validate
            new_record = @ar_class.new(row_hash)
            new_record.status = Lookup::RowStatus.imported
            new_record.quality_code ||= Lookup::QualityCode.ok

            # Record not valid: log the error
            unless new_record.valid?
              validation_errors = new_record.errors.messages.map { |k,v| "#{k} #{v.first}" }.join(", ")
              put_message "Row #{$.} failed - #{validation_errors}"
              failed += 1
              next
            end

            # Check for an existing record
            existing_record_id = current_keys[new_record.unique_key]
            if existing_record_id

              # Update existing
              existing = @ar_class.find_by(id: existing_record_id)
              existing.attributes = row_hash
              if existing.changed?
                if existing.status == Lookup::RowStatus.imported
                  existing.save
                  updated += 1
                else
                  put_message "Row #{$.} skipped - status of existing row (id:#{existing.id}) isn't 'imported'"
                  skipped += 1
                end
              else
                ignored += 1
              end

            else

              # Insert new row
              new_record.save
              inserted += 1

            end
          end
        end

        # Completion feedback
        total_rows = inserted + updated + ignored + failed + skipped
        put_message "Import complete.", time: true
        result = []
        result << "Results: #{total_rows} rows processed"
        result << "#{inserted} created"
        result << "#{updated} updated"
        result << "#{ignored} not changed"
        result << "#{skipped} skipped"
        result << "#{failed} failed"
        put_message result.join(", ")

      rescue Exception => ex
        put_message "Import aborted! - #{ex.message}", time: true
        if ex.class.to_s == "ActiveRecord::UnknownAttributeError"
          allowed_attribute_list = @ar_class.allowed_attributes.join(", ")
          put_message "Allowed column names: #{allowed_attribute_list}"
        end
      end

      put_message "Table '#{@ar_class.to_s.tableize}' new row count: #{@ar_class.count}"
    end

    def put_message(text, options={})
      text = "[#{timestamp}] #{text}" if options[:time]
      @results << text
      puts(text)
    end

    def timestamp
      Time.now.strftime("%H:%M:%S")
    end

end
