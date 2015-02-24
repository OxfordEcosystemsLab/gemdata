class BranchLightPlacementImporter < RowImporter

  def object
    @blp
  end

  def read_row(values, logger)
    @blp = find_or_new({
      :branch => find_or_create_branch(values[2]),
    })
    attempt_to_overwrite!(@blp)
    @blp.az_branch = values[3]
    @blp.vd_branch = values[4]
    @blp.hd_branch = values[5]
    @blp.vground_branch = values[6]
    @blp.light_cond = values[7] unless values[7] == 'NA'
    @blp.liana_cov = values[8] unless values[8] == 'NA'
    @blp.note = values[9] unless values[9] == 'NA'
    @blp.start = Date.strptime(values[10], "%Y-%m-%d %H:%M:%S") unless values[10] == 'NA'
    @blp.finish = Date.strptime(values[11], "%Y-%m-%d %H:%M:%S") unless values[11] == 'NA'
    @blp.clouds = values[12] unless values[12] == 'NA'
    @blp.light = values[13] unless values[13] == 'NA'
    @blp.rain = values[14] unless values[14] == 'NA'
    @blp.checked = values[15] unless values[15] == 'NA'
    @blp.mean_branch_PPFD = values[16] unless values[16] == 'NA'
    @blp.mean_ref_PPFD = values[17] unless values[17] == 'NA'
    @blp.rel_light_proportion = values[18] unless values[18] == 'NA'
    @blp.time_advance = values[19] unless values[19] == 'NA'
    @blp.time_delay = values[20] unless values[20] == 'NA'
    @blp.validation_note = values[21] unless values[21] == 'NA'
    @blp.confidence = values[22] unless values[22] == 'NA'
    @blp.field_note = values[23] unless values[23] == 'NA'
    quality_flag = ''
    if not values[24].blank? then
      quality_flag = values[24].upcase
    end
    @blp.quality_flag = quality_flag
    save_with_status!
  end

  private

    def self.ar_class
      BranchLightPlacement
    end

end
