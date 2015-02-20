class LeafPartCharacteristicsImporter < RowImporter

  def object
    @lc
  end

  def read_row(values, logger)
    # The leaf part code translation should just happen by magic
    # Just make sure the translation table is loaded before you do
    # this import
    @lc = find_or_new({
      leaf_part: find_or_create_leaf_part(values[4].gsub(/\s/, '')),
    })
    attempt_to_overwrite!(@lc)
    
    
    @lc.date = Date.strptime(values[1], "%Y-%m-%d")
    @lc.evaluators = values[2]
    # genus_sp 3
    # leafcode 4 (see above)
    @lc.original_code = values[5].gsub(/\s/, '')
    @lc.fresh_mass = values[6] unless values[6] == 'NA'
    @lc.dry_mass = values[7] unless values[7] == 'NA'
    @lc.thickness = values[8] unless values[8] == 'NA'
    @lc.petiole_width = values[9] unless values[9] == 'NA'
    @lc.dry_mass_corrected = values[10] unless values[10] == 'NA' or values[10].blank?
    @lc.comments = values[11] unless values[11] == 'NA' or values[10].blank?
    @lc.quality_flag = values[12] unless values[12] == 'NA' or values[10].blank?
    save_with_status!
  end

  private

    def self.ar_class
      LeafPartCharacteristics
    end

end
