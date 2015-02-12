class LeafVenationImporter < RowImporter

  def object
    @lv
  end

  def read_row(values, logger)
    @lv = find_or_new({
      :leaf_part => find_or_create_leaf_part(values[1])
    })
    attempt_to_overwrite!(@lv)
    @lv.census_comparable_branch_code = values[0]
    @lv.image_enhanced = values[2] unless values[2] == 'NA'
    @lv.image_traced = values[3] unless values[3] == 'NA'
    @lv.image_veins_fitted = values[4] unless values[4] == 'NA'
    @lv.image_areoles_fitted = values[5] unless values[5] == 'NA'
    @lv.image_data_vertex_list = values[6] unless values[6] == 'NA'
    @lv.image_data_edge_list = values[7] unless values[7] == 'NA'
    @lv.image_data_edge_perims = values[8] unless values[8] == 'NA'
    @lv.image_data_edge_radii = values[9] unless values[9] == 'NA'
    @lv.vein_image_good = values[19]
    
    Rails.logger.error 'Andy'
    Rails.logger.error values[19]
    Rails.logger.error @lv.vein_image_good
    
    @lv.vein_area_analyzed = values[20] unless values[20] == 'NA'
    @lv.vein_density = values[21] unless values[21] == 'NA'
    @lv.vein_length_mean = values[22] unless values[22] == 'NA'
    @lv.vein_length_sd = values[23] unless values[23] == 'NA'
    @lv.vein_tortuosity_mean = values[24] unless values[24] == 'NA'
    @lv.vein_tortuosity_sd = values[25] unless values[25] == 'NA'
    @lv.vein_minimum_spanning_tree_ratio = values[26] unless values[26] == 'NA'
    @lv.vein_areole_elongation_ratio_mean = values[27] unless values[27] == 'NA'
    @lv.vein_areole_elongation_ratio_sd = values[28] unless values[28] == 'NA'
    @lv.vein_areole_roughness_mean = values[29] unless values[29] == 'NA'
    @lv.vein_areole_roughness_sd = values[30] unless values[30] == 'NA'
    @lv.vein_areole_loopiness = values[31] unless values[31] == 'NA'
    @lv.vein_freely_ending_veinlet_ratio = values[32] unless values[32] == 'NA'
    @lv.vein_area_fraction = values[33] unless values[33] == 'NA'
    @lv.vein_thickness_mean_weighted = values[34] unless values[34] == 'NA'
    @lv.vein_thickness_sd_weighted = values[35] unless values[35] == 'NA'
    save_with_status!
  end

  private

    def self.ar_class
      LeafVenation
    end

end
