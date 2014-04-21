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
            @ar_class.read_row(row)
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
