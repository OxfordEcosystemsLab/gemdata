class LargeTreeDendrometerReadingImporter < RowImporter

  def object
    @rec
  end

  def read_row(values, logger)
    date = Date.strptime("#{values[3]} #{values[4]} #{values[5]}", "%Y %m %d")
    tree = find_or_create_tree_from_parts(values[0], values[1], values[2])
    @rec = find_or_new({
      tree:                            tree,
      date:                            date,
      pom_height_m:                    values[6],
      dendrometer_reading_mm:          values[7],
      dendrometer_reading_replaced_mm: values[8],
      status_code:                     values[9],
      mortality_code:                  values[10],
      comments:                        values[11]
    })
    attempt_to_overwrite!(@rec)
    save_with_status!
  end

  private

    def self.ar_class
      LargeTreeDendrometerReading
    end

end
