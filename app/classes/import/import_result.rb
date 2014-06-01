class ImportResult

  attr_reader :status, :ar_class

  def initialize(ar_class, status)
    @ar_class = ar_class
    @status = status
  end

end
