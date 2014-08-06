class LeafMorphologyImporter < RowImporter

  def object
    @az
  end

  def read_row(values, logger)

    @az = find_or_new({
      :leaf => find_or_create_leaf(values[4]),
      :date => Date.strptime(values[1], "%d/%m/%Y")
    })
    @az.evaluators = values[2]
    @az.fresh_mass = nil_if_zero(values[5])
    @az.dry_mass = nil_if_zero(values[6])
    @az.thickness = nil_if_zero(values[7])
    @az.petiole_width = nil_if_zero(values[8])
    @az.comments = values[9]

    save_with_status!
  end

  private

    def self.ar_class
      LeafMorphology
    end

end
