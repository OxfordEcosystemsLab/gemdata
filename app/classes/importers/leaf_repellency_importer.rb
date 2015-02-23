class LeafRepellencyImporter < RowImporter

  def object
    @lr
  end

  def read_row(values, logger)
    @lr = find_or_new({
      :branch => find_or_create_branch(values[2]),
      :replica => values[8]
    })
    attempt_to_overwrite!(@lr)
    @lr.photo_number = values[9]
    @lr.angle = values[15]
    @lr.angle_exclude = values[16].upcase unless values[16].blank?
    @lr.angle_comments = values[17]
    save_with_status!
  end

  private

    def self.ar_class
      LeafRepellency
    end

end

