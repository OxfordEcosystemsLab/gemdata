# A utility class for providing logging during an import
class ImportLogger

  def initialize(log, options={})
    @log = log || ImportLog.new
    @options = options
  end

  def notice(text)
    put_message text
  end


  private

    def put_message(text)
      text = "[#{timestamp}] #{text}" if @options[:time]
      @log << text
      puts(text)
    end

    def timestamp
      Time.now.strftime("%H:%M:%S")
    end
end

