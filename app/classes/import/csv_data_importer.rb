require 'csv'

class CSVDataImporter

  def initialize(ar_class, csv_file, results)
    @ar_class = ar_class
    @csv_file = csv_file
    @logger = ImportLogger.new(results, time: true)
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
      @logger.notice "Table '#{@ar_class.table_name}' initial row count: #{@ar_class.count}"

      @logger.notice "Importing #{@ar_class.table_human_name}..."

      status_counts = Hash.new(0)
      @ar_class.transaction do

        transaction_has_errors = false

        # Loop the CSV rows
        CSV.foreach(@csv_file, headers: true) do |row|
          begin
            importer = @ar_class.new
            status = importer.read_row(row, @logger) || Lookup::ImportStatus.failed
            status_counts[status] += 1
          rescue => ex
            transaction_has_errors = true
            @logger.error "Import aborted processing line #{$.}! - #{ex.message}"
            if ex.class.to_s == "ActiveRecord::UnknownAttributeError"
              allowed_attribute_list = @ar_class.allowed_attributes.join(", ")
              @logger.notice "Allowed column names: #{allowed_attribute_list}"
            end
          end
        end

        if transaction_has_errors
          raise 'transaction_has_errors'
        end
      end

      # Completion feedback
      total_rows = status_counts.length
      @logger.notice "Import complete."
      result = []
      result << "Results: #{total_rows} rows processed"
      result << "#{status_counts['inserted']} created"
      result << "#{status_counts['updated']} updated"
      result << "#{status_counts['ignore']} not changed"
      result << "#{status_counts['skipped']} skipped"
      result << "#{status_counts['failed']} failed"
      @logger.notice result.join(", ")

      @logger.notice "Table '#{@ar_class.table_name}' new row count: #{@ar_class.count}"
    end

end
