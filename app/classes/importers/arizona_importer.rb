class ArizonaImporter < RowImporter

  def object
    @az
  end

  def read_row(values, logger)
    @az = Arizona.new
    @az.date = Date.strptime(values[1], "%d/%m/%Y")
    @az.evaluators = values[2]
    @az.code = values[4]
    @az.fresh_mass = nil_if_zero(values[5])
    @az.dry_mass = nil_if_zero(values[6])
    @az.thickness = nil_if_zero(values[7])
    @az.petiole_width = nil_if_zero(values[8])
    @az.comments = values[9]

    if @az.save
      status = Lookup::ImportStatus.inserted
    else
      status = Lookup::ImportStatus.failed
    end

    return status
  end

  private

    def is_nil_value(value)
      value.nil? || value.to_f == 0 || value == '-'
    end

    def nil_if_zero(value)
      return value unless is_nil_value(value)
    end

    def self.ar_class
      Arizona
    end

end
