require 'csv'

class BaseCsvHandler

  def initialize(importer_class, csv_file, results)
    @importer_class = importer_class
    @csv_file = csv_file
    @logger = ImportLogger.new(results, time: true)
    @status_counts = Hash.new(0)
  end

  # Import in another thread
  def import!
    t = Thread.new do

      @logger.notice "Table '#{@importer_class.table_name}' initial row count: #{@importer_class.count}"
      @logger.notice "Importing #{@importer_class.table_name}..."

      @importer_class.transaction do
        if !handle_csv
          raise 'transaction_has_errors'
        end
      end

      @logger.notice "Import complete."
      @logger.notice generate_summary_message
      @logger.notice "Table '#{@importer_class.table_name}' new row count: #{@importer_class.count}"
      ActiveRecord::Base.connection.close
    end
    at_exit { t.join }
  end

  private

    def handle_csv

      transaction_is_ok = true

      prepare_pre_import

      CSV.foreach(@csv_file, headers: true) do |row|
        begin
          importer = @importer_class.new
          prepare_importer(importer)
          status = importer.read_row(row, @logger) || Lookup::ImportStatus.failed
          @status_counts[status] += 1
        rescue => ex
          transaction_is_ok = false
          @logger.error "Import aborted processing line #{$.}! - #{ex.message}"
        end
      end

      transaction_is_ok
    end

    def generate_summary_message
      # Completion feedback
      total_rows = @status_counts.length
      result = []
      result << "Results: #{total_rows} rows processed"
      result << "#{@status_counts['inserted']} created"
      result << "#{@status_counts['updated']} updated"
      result << "#{@status_counts['ignore']} not changed"
      result << "#{@status_counts['skipped']} skipped"
      result << "#{@status_counts['failed']} failed"
      result.join(", ")
    end

    # The following two methods are hooks to be overriden in child classes
    def prepare_pre_import
    end

    def prepare_importer(importer)
    end

end
