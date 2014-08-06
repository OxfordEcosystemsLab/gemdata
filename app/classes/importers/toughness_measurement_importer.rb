class ToughnessMeasurementImporter < RowImporter

  def object
    @tm
  end

  def read_row(values, logger)

    @tm = find_or_new({
      :branch => find_or_create_branch(values[3]),
      :date   => Date.strptime(values[1], "%d/%m/%Y")
    })

    @tm.evaluator = values[2]
    @tm.replica = values[4]
    @tm.thickness = values[5]
    @tm.width = values[6]
    @tm.lines = values[7]
    @tm.punch = values[8]

    save_with_status!
  end

  private

    def self.ar_class
      ToughnessMeasurement
    end

end
