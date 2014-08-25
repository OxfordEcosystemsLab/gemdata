class LeafAreaImporter < RowImporter

  def object
    @lr
  end

  def read_row(values, logger)

    @lr = find_or_new({
      :leaf_part => find_or_create_leaf_part(values[2]),
      :date => Date.strptime(values[0], "%y%m%d")
    })
    attempt_to_overwrite!(@lr)

    @lr.person = values[1]
    @lr.area = values[3]

    save_with_status!
  end

  private

    def self.ar_class
      LeafArea
    end

end
