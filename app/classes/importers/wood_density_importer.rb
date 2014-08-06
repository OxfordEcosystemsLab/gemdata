class WoodDensityImporter < RowImporter

  def object
    @wood
  end

  def read_row(values, logger)

    @wood = find_or_new({
      date:   Date.strptime(values[1], "%d/%m/%Y"),
      branch: find_or_create_branch(values[3])
    })

    @wood.evaluator = values[2]
    @wood.branch_number = values[4]
    @wood.volume = values[5].to_f unless values[5].nil?

    save_with_status!
  end

  private

    def self.ar_class
      WoodDensity
    end

end
