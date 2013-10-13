require 'csv'

class CSVDataImporter

  attr_reader :errors

  def import_all
    message "Importing..."

    # IngrowthCoreValues.delete_all # TEMP TEMP TEMP TEMP TEMP

    import_data("ICEltr_sample.csv", IngrowthCoreValues)
    # Add more

    message "Done."
    message "ERRORS:\n#{@errors.join("\n")}" unless @errors.blank?
  end

  private

    def import_data(csv_file, ar_class)
      class_name = ar_class.to_s.underscore.gsub('_',' ')
      message(" - #{class_name}")
      full_path = Rails.root.join('db', 'import', csv_file)
      begin

        # Get a hash of the unique keys to id
        current_keys = ar_class.get_unique_keys_hash

        # Loop the CSV rows
        ar_class.transaction do
          CSV.foreach(full_path, headers: true) do |row|

            # Swap NaN values for blanks
            row_hash = row.to_hash
            row_hash.map { |k,v| row_hash[k] = (v == 'NaN' ? '' : v) }

            # Create the AR object and validate
            record = ar_class.new(row_hash)
            if record.valid?

              # Check for an existing record
              existing_record_id = current_keys[record.unique_key]

              # Save or update
              if existing_record_id
                ar_class.find_by(id: existing_record_id).update_attributes(row_hash)
              else
                record.save
              end

            else

              # Log the error
              all_errors = record.errors.messages.map { |k,v| "#{k} #{v.first}" }.join(", ")
              add_error("Row #{$.} - #{all_errors}")

            end

          end
        end
      rescue Exception => ex
        add_error("Aborted! #{class_name} - #{ex.message}")
      end
    end

    def message(text)
      puts(text)
      # Rails.logger.debug(text)
    end

    def add_error(message)
      @errors ||= []
      @errors << message
    end

end
