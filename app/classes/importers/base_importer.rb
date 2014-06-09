class BaseImporter

  def self.table_name
    @ar_class.to_s.tableize
  end

  def self.count
    @ar_class.count
  end

  def self.transaction(&block)
    @ar_class.transaction(&block)
  end

  def self.table_human_name
    self.table_name
  end

  # expect these to be overwritten
  def object
    raise NoMethodError
  end

  def read_row
    raise NoMethodError
  end

end

