# A utility class for providing logging during an import
class ImportLogger

  def initialize(log)
    @log = log || ImportLog.new
  end

  def put_message(text, options={})
    text = "[#{timestamp}] #{text}" if options[:time]
    @log << text
    puts(text)
  end

  # maybe eventually define #error #warn #notice

  private

    def timestamp
      Time.now.strftime("%H:%M:%S")
    end
end

