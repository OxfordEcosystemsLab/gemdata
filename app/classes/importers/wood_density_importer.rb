class WoodDensityImporter < RowImporter

  def object
    @wood
  end

  def read_row(values, logger)
    @wood = WoodDensity.new
    @wood.date = Date.strptime(values[1], "%d/%m/%Y")
    @wood.evaluator = values[2]
    @wood.code = values[3]
    @wood.branch_number = values[4]
    @wood.volume = values[5].to_f unless values[5].nil?

    save_with_status!
  end

  private

    def self.ar_class
      WoodDensity
    end

end
