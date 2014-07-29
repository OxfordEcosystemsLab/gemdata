require 'csv'
require 'exceptions'

class BaseCsvHandler

  def initialize(importer_class, csv_file, results, overwrite_batch_id)
    @importer_class = importer_class
    @csv_file = csv_file
    @logger = ImportLogger.new(results, time: true)
    @status_counts = Hash.new(0)
    @overwrite_batch_id = overwrite_batch_id
  end

  # Import in another thread
  def import!
    t = Thread.new do

      @batch = Batch.new :started => Time.new, :import_address => @logger.address
      @batch.started = Time.new
      @batch.save!

      transaction_completed = true

      @logger.notice "Table '#{@importer_class.table_name}' initial row count: #{@importer_class.count}"
      @logger.notice "Importing #{@importer_class.table_name}..."

      begin
        @importer_class.transaction do
          if !handle_csv
            raise Gemdata::TransactionHasErrors
          end
        end
      rescue Gemdata::TransactionHasErrors => e
        @logger.error "Processing did not go smoothly, changes are being rolled back."
        transaction_completed = false
      else
        @logger.notice "Import complete."
        @logger.notice generate_summary_message
        @logger.notice "Table '#{@importer_class.table_name}' new row count: #{@importer_class.count}"
      end

      @batch.transaction_passed = transaction_completed
      @batch.finished = Time.new
      @batch.save!

      ActiveRecord::Base.connection.close
    end
    at_exit { t.join }
    t
  end


  private

    def handle_csv

      transaction_is_ok = true

      prepare_pre_import

      importer = prepare_importer(@importer_class.new)

      begin

        row_number = 1

        open_file(@csv_file).each do |line|

          row = CSV.parse_line(line, :quote_char => "\x00")

          row_number += 1

          if skip_row?(row_number, row)
            next
          end

          begin
            status = importer.read_row(row, @logger) || Lookup::ImportStatus.failed
            @status_counts[status] += 1
          rescue => ex
            transaction_is_ok = false
            @status_counts[Lookup::ImportStatus.failed] += 1
            @logger.error "Import aborted processing line #{row_number} - #{ex.message}"
          end
        end
      rescue => ex
        @logger.error "Error reading CSV - #{ex.message}"
        transaction_is_ok = false
      end

      transaction_is_ok
    end

    def open_file(file)
      begin
        File.open(file, 'rb')
      rescue ArgumentError => ex
        File.open(file, 'rb:ISO-8859-1:UTF-8')
      end
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

    # The following methods are hooks to be overriden in child classes
    def prepare_pre_import
    end

    def prepare_importer(importer)

      if importer.respond_to? :batch_id=
        importer.batch_id = @batch.id
      end

      if importer.respond_to? :overwrite_batch_id=
        importer.overwrite_batch_id = @overwrite_batch_id
      end

      importer

    end

    def skip_row?(n, values)
      n == 1
    end

end
