class LeafPartCharacteristicsImporter < RowImporter

  def object
    @lp
  end

  def read_row(values, logger)
    code = values[4].gsub(/\s/, '')
    reader = CodeReader.new(code, 'LeafPart')
    @lp = find_or_new({
      :leaf => find_or_create_leaf(code, reader),
      :code => reader.leaf_part
    })
    attempt_to_overwrite!(@lp)
    @lp.original_code = values[5].gsub(/\s/, '')
    @lp.evaluators = values[2]
    @lp.fresh_mass = values[6] unless values[6] == '-'
    @lp.dry_mass = values[7] unless values[7] == '-'
    @lp.thickness = values[8] unless values[8] == '-'
    @lp.petiole_width = values[9] unless values[9] == '-'
    @lp.dry_mass_corrected = values[10] unless values[10] == '-' or values[10].blank?
    save_with_status!
  end

  private

    def self.ar_class
      LeafPart
    end

end
