class SpectraMeasurementImporter < RowImporter

  def object
    @sm
  end

  def read_row(values, logger)
    @sm = SpectraMeasurement.new

    @sm.code     = values[1] + '-L' + values[4]
    @sm.comments = values[2]
    @sm.branch   = values[3]
    @sm.order    = values[4]
    @sm.type     = values[5]

    (350..1100).each do |n|
      @sm.send("measurement_#{n}=", values[n - 350 + 6])
    end

    save_with_status!
  end

  private

    def self.ar_class
      SpectraMeasurement
    end

end

