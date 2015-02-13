class LeafDryMatterImporter < RowImporter

  def object
    @dm
  end

  def read_row(values, logger)

    @dm = find_or_new({
      :leaf_part => find_or_create_leaf_part(values[4])
    })
    attempt_to_overwrite!(@dm)
    @dm.date = Date.strptime(values[1], "%d/%m/%Y")
    @dm.evaluators = values[2]
    @dm.fresh_mass = values[5] unless values[5] == '-'
    @dm.dry_mass = values[6] unless values[6] == '-'
    @dm.thickness = values[7] unless values[7] == '-'
    @dm.petiole_width = values[8] unless values[8] == '-'
    @dm.comments = values[9]
    save_with_status!
  end

    def self.ar_class
      LeafDryMatter
    end

end
