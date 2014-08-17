class BranchLightMeasurementImporter < RowImporter

  def object
    @blm
  end

  def read_row(values, logger)

    @blm = find_or_new({
      :number   => values[1],
      :datetime => Time.strptime(values[2] + ' UTC', "%Y-%m-%d %H:%M:%S %Z")
    })
    attempt_to_overwrite!(@blm)

    @blm.branch_light_placement = BranchLightPlacement.find_by_time @blm.datetime
    @blm.measurement = values[3]
    @blm.photons     = values[4]

    save_with_status!
  end

  private

    def self.ar_class
      BranchLightMeasurement
    end

end
