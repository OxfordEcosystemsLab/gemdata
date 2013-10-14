require 'csv'

class CSVDataImporter

  def initialize(ar_class, csv_file_name)
    @ar_class = ar_class
    @csv_file_name = csv_file_name
  end

  def import!

    # IngrowthCoreValues.delete_all # TEMP TEMP TEMP TEMP TEMP

    import_data

  end

  private

    def import_data
      class_name = @ar_class.to_s.underscore.gsub('_',' ').capitalize
      put_message "Importing #{class_name}...", time: true

      failed, updated, inserted, ignored = 0, 0, 0, 0

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

            # Jump to next row if blank
            if row_hash.blank?
              put_message " Row #{$.} failed - empty row"
              next
            end

            # Create the AR object and validate
            new_record = @ar_class.new(row_hash)
            if new_record.valid?

              # Check for an existing record
              existing_record_id = current_keys[new_record.unique_key]

              # Save or update
              if existing_record_id
                existing = @ar_class.find_by(id: existing_record_id)
                existing.attributes = row_hash
                existing.changed? ? updated += 1 : ignored += 1
                existing.save
              else
                new_record.save
                inserted += 1
              end

            else
              # Record not valid: log the error
              all_errors = new_record.errors.messages.map { |k,v| "#{k} #{v.first}" }.join(", ")
              put_message " Row #{$.} failed - #{all_errors}"
              failed += 1
            end

          end
        end

        # Completion feedback
        result = []
        result << "Import complete."
        result << "Processed: #{inserted + updated + ignored + failed} (#{inserted} created, #{updated} updated, #{ignored} not changed, #{failed} failed)."
        result << "Table total rows: #{@ar_class.count}"
        put_message result.join(" "), time: true

      rescue Exception => ex
        put_message "Import aborted! - #{ex.message}", time: true
      end
    end

    def put_message(text, options={})
      text = "[#{timestamp}] #{text}" if options[:time]
      puts(text)
    end

    def timestamp
      Time.now.strftime("%H:%M:%S")
    end

end
