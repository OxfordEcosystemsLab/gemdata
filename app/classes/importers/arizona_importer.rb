require 'csv'

class ArizonaImporter

  def get_object
    @az
  end

  def self.table_name
    Arizona.to_s.tableize
  end

  def self.count
    Arizona.count
  end

  def self.transaction(&block)
    Arizona.transaction(&block)
  end

  def self.table_human_name
    'Arizona'
  end

  def self.read_row(values, logger)
    @az = Arizona.new
    @az.date = Date.strptime(values[1], "%d/%m/%Y")
    @az.evaluators = values[2]
    @az.code = values[4]
    @az.fresh_mass = values[5]
    @az.dry_mass = values[6]
    @az.thickness = values[7] unless is_nil_value(values[7])
    @az.petiole_width = values[8] unless is_nil_value(values[8])
    @az.comments = values[9]

    if @az.save
      status = Lookup::ImportStatus.inserted
    else
      status = Lookup::ImportStatus.failed
    end

    return ImportResult.new(@az, status)
  end

  private

    def self.is_nil_value(value)
      value.nil? || value.to_f == 0 || value == '-'
    end

end
