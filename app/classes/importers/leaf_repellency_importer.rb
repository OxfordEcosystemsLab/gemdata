class LeafRepellencyImporter < RowImporter

  def object
    @lr
  end

  def read_row(values, logger)

    @lr = find_or_new({
      :branch => find_or_create_branch(values[1]),
      :replica => values[2],
    })
    attempt_to_overwrite!(@lr)

    @lr.photo_number = values[3]
    @lr.angle = values[4]

    save_with_status!
  end

  private

    def self.ar_class
      LeafRepellency
    end

end
