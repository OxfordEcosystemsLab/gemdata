class CrownPerimeterImporter < RowImporter

  def object
    @cp
  end

  def read_row(values, logger)

    @cp = CrownPerimeter.new
    @cp.tree = find_tree values[3]
    @cp.batch_id = @batch_id

    @cp.seq = values[4]
    @cp.sun = nil_if_na values[5]
    @cp.reading_type = nil_if_na values[6]
    @cp.az = values[7]
    @cp.vd = values[8]
    @cp.hd = values[9]
    @cp.note = nil_if_na values[10]
    @cp.x = values[11]
    @cp.y = values[12]
    @cp.z = values[13]

    save_with_status!
  end

  private

    def self.ar_class
      CrownPerimeter
    end

end
