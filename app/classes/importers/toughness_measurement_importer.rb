class ToughnessMeasurementImporter < RowImporter

  def object
    @tm
  end

  def read_row(values, logger)
    @tm = ToughnessMeasurement.new
    @tm.date = Date.strptime(values[1], "%d/%m/%Y")
    @tm.evaluator = values[2]
    @tm.code = values[3]
    @tm.replica = values[4]
    @tm.thickness = values[5]
    @tm.width = values[6]
    @tm.lines = values[7]
    @tm.punch = values[8]

    if @tm.save
      status = Lookup::ImportStatus.inserted
    else
      status = Lookup::ImportStatus.failed
    end

    return status
  end

  private

    def self.ar_class
      ToughnessMeasurement
    end

end
