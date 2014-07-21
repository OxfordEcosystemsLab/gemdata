class RowImporter

  def self.table_name
    ar_class.to_s.tableize
  end

  def self.table_human_name
    ar_class.to_s.underscore.gsub('_',' ').capitalize
  end

  def self.count
    ar_class.count
  end

  def self.transaction(&block)
    ar_class.transaction(&block)
  end

  # expect these to be overwritten

  def self.handler_class
    BaseCsvHandler
  end

  def object
    raise NoMethodError
  end

  def read_row(values, logger)
    raise NoMethodError
  end

  private

    def self.ar_class
      raise NoMethodError
    end

end

