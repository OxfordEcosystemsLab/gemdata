class SpectraMeasurementImporter < RowImporter

  def object
    @sm
  end

  def read_row(values, logger)

    @sm = find_or_new({
      leaf:  find_or_create_leaf(values[1] + '-L' + values[4]),
      order: values[4]
    })
    attempt_to_overwrite!(@sm)

    @sm.comments = values[2]
    @sm.branch   = values[3]
    @sm.type     = values[5]

    (350..1100).each do |n|
      @sm.send("measurement_#{n}=", values[n - 350 + 6])
    end

    save_with_status!
  end

  def self.ar_class
    SpectraMeasurement
  end

end

