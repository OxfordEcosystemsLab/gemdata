require 'csv'

class CSVDataImporter

  attr_reader :results

  def initialize(ar_class, csv_file_name)
    @ar_class = ar_class
    @csv_file_name = csv_file_name
  end

  def import!
    import_data
  end

  private

    def import_data
      put_message "Table '#{@ar_class.to_s.tableize}' initial row count: #{@ar_class.count}"

      table_human_name = @ar_class.to_s.underscore.gsub('_',' ').capitalize
      put_message "Importing #{table_human_name}...", time: true

      failed, updated, inserted, ignored, skipped = 0, 0, 0, 0, 0

      begin
        @ar_class.transaction do

          # Get a hash of all current unique keys to id
          current_keys = @ar_class.get_unique_keys_hash

          # Loop the CSV rows
          full_path = Rails.root.join('db', 'import', @csv_file_name)
          CSV.foreach(full_path, headers: true) do |row|

            # Swap NaN values for blanks
            row_hash = row.to_hash
            row_hash.map { |k,v| row_hash[k] = (v == 'NaN' ? '' : v) }

            # Remove protected attributes
            @ar_class.protected_attributes.each { |col| row_hash.delete(col) }

            # Report blank headings
            if $. == 2 && row_hash.keys.any? { |k| k.blank? }
              raise "You have a blank column heading!"
            end

            # Jump to next row if blank
            if row_hash.blank?
              put_message "Row #{$.} skipped - empty row"
              skipped += 1
              next
            end

            # Create the AR object and validate
            new_record = @ar_class.new(row_hash)

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
              new_record.status = Lookup::RowStatus.imported
              new_record.save
              inserted += 1

            end
          end
        end

        # Completion feedback
        total_rows = inserted + updated + ignored + failed + skipped
        result = []
        result << "Import complete."
        result << "#{total_rows} rows processed:"
        result << "  #{inserted} created"
        result << "  #{updated} updated"
        result << "  #{ignored} not changed"
        result << "  #{skipped} skipped"
        result << "  #{failed} failed"
        put_message result.join("\n"), time: true

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
      @results ||= []
      @results << text
      puts(text)
    end

    def timestamp
      Time.now.strftime("%H:%M:%S")
    end

end
