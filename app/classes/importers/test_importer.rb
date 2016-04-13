class TestImporter < RowImporter

  def object
    @tst
  end

  def read_row(values, logger)
    @tst = find_or_new
    attempt_to_overwrite!(@tst)
    @tst.name = values[1]
    @tst.data = values[2]
    save_with_status!
  end

  private

    def self.ar_class
      TestImporter
    end

end
