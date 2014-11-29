class SmallTreeDendrometerReadingImporter < RowImporter

  def object
    @rec
  end

  def read_row(values, logger)
    date = Date.strptime("#{values[3]} #{values[4]} #{values[5]}", "%Y %m %d")
    tree = find_or_create_tree_from_parts(values[0], values[1], values[2])
    @rec = find_or_new({
      tree:               tree,
      date:               date,
      wood_density_g_m2:  nil_if_na(values[6]),
      tree_height_m:      nil_if_na(values[7]),
      pom_height_m:       nil_if_na(values[8]),
      dbh_northsouth_cm:  nil_if_na(values[9]),
      dbh_westeast_cm:    nil_if_na(values[10]),
      rainfor_flag1:      values[11],
      rainfor_flag2:      values[12],
      rainfor_flag3:      values[13],
      quality_code:       values[14],
      comments:           values[15]
    })
    attempt_to_overwrite!(@rec)
    save_with_status!
  end

  private

    def self.ar_class
      SmallTreeDendrometerReading
    end

end
