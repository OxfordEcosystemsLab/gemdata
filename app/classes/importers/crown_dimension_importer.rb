class CrownDimensionImporter < RowImporter

  def object
    @cd
  end

  def read_row(values, logger)

    @cd = find_or_new({
      :tree      => find_tree(values[1]),
      :depth     => values[2],
      :width_max => values[3],
      :vol       => values[4]
    })
    attempt_to_overwrite!(@cd)
    save_with_status!
  end

  private

    def self.ar_class
      CrownDimension
    end

end
