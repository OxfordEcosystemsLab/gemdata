class AddLeafVenation < ActiveRecord::Migration
  def change
    change_table :leaf_venations do |t|
      t.string :census_comparable_branch_code
      t.string :image_enhanced
      t.string :image_traced
      t.string :image_veins_fitted
      t.string :image_areoles_fitted
      t.string :image_data_vertex_list
      t.string :image_data_edge_list
      t.string :image_data_edge_perims
      t.string :image_data_edge_radii
      t.boolean :vein_image_good, :defaukt => true
      t.float :vein_area_analyzed
      t.float :vein_density
      t.float :vein_length_mean
      t.float :vein_length_sd
      t.float :vein_tortuosity_mean
      t.float :vein_tortuosity_sd
      t.float :vein_minimum_spanning_tree_ratio
      t.float :vein_areole_elongation_ratio_mean
      t.float :vein_areole_elongation_ratio_sd
      t.float :vein_areole_roughness_mean
      t.float :vein_areole_roughness_sd
      t.float :vein_areole_loopiness
      t.float :vein_freely_ending_veinlet_ratio
      t.float :vein_area_fraction
      t.float :vein_thickness_mean_weighted
      t.float :vein_thickness_sd_weighted
      t.index :census_comparable_branch_code
    end
  end
end
