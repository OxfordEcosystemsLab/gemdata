class CrownDimensionImporter < RowImporter

  def object
    @cd
  end

  def read_row(values, logger)

    @cd = find_or_new({
      :tree => find_tree(values[1])
    })
    attempt_to_overwrite!(@cd)
    @cd.depth = values[2]
    @cd.h_tree = values[3]
    @cd.width_max = values[4]
    @cd.vol = values[5]        
    @cd.poly_vol = values[6]
    @cd.surf_area = values[7]
    # site = values[8]
    save_with_status!
  end

  private

    def self.ar_class
      CrownDimension
    end

end

