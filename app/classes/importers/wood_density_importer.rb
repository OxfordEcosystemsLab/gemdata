class WoodDensityImporter < RowImporter

  def object
    @wood
  end

  def read_row(values, logger)

    @wood = find_or_new({
      branch: find_or_create_branch(values[3]),
      branch_type: values[5]
    })
    attempt_to_overwrite!(@wood)
    @wood.date = Date.strptime(values[1], "%Y-%m-%d")
    @wood.evaluator = values[2].strip unless values[2].blank?
    @wood.original_code = values[4]
    @wood.fresh_volume_cm3 = values[6]
    @wood.dry_mass = values[7]
    @wood.density_gcm3 = values[8]
    @wood.comment = values[9].strip unless values[9].blank?
    save_with_status!
  end

  private

    def self.ar_class
      WoodDensity
    end

end
