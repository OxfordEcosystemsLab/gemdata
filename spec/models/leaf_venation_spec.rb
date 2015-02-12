require 'spec_helper'

describe LeafVenation do

  before :each do
    leaf_part = set_up_leaf_part('ACJ-01', 'I2014', 'B1S', 'L1', 'S')
    
    @lv = LeafVenation.new
    @lv.leaf_part = leaf_part
    @lv.census_comparable_branch_code = 'ACJ01-I2014-S'
    @lv.image_enhanced = 'ACJ01-I2014-B1S-L1S-CLAHE.jpg'
    @lv.image_traced = 'ACJ01-I2014-B1S-L1S-TRACED.png'
    @lv.image_veins_fitted = 'ACJ01-I2014-B1S-L1S-VEINS.png'
    @lv.image_areoles_fitted = 'ACJ01-I2014-B1S-L1S-AREOLES.png'
    @lv.image_data_vertex_list = 'ACJ01-I2014-B1S-L1S-VERTEXLIST.csv'
    @lv.image_data_edge_list = 'ACJ01-I2014-B1S-L1S-EDGELIST.csv'
    @lv.image_data_edge_perims = 'ACJ01-I2014-B1S-L1S-EDGEPERIMS.csv'
    @lv.image_data_edge_radii = 'ACJ01-I2014-B1S-L1S-EDGERADII.csv'
    @lv.vein_image_good = true
    @lv.vein_area_analyzed = 76.6393
    @lv.vein_density = 12.0705
    @lv.vein_length_mean = 0.24921
    @lv.vein_length_sd = 0.19562
    @lv.vein_tortuosity_mean = 1.4586
    @lv.vein_tortuosity_sd = 0.45884
    @lv.vein_minimum_spanning_tree_ratio = 0.64191
    @lv.vein_areole_elongation_ratio_mean = 1.6564
    @lv.vein_areole_elongation_ratio_sd = 0.46877
    @lv.vein_areole_roughness_mean = 18.5919
    @lv.vein_areole_roughness_sd = 6.0478
    @lv.vein_areole_loopiness = 20.0908
    @lv.vein_freely_ending_veinlet_ratio = 0.17241
    @lv.vein_area_fraction = 0.41375
    @lv.vein_thickness_mean_weighted = 0.034277654
    @lv.vein_thickness_sd_weighted = 0.009118994
    @lv.batch_id = 1
  end

  it 'is not valid on its own' do
    expect(LeafVenation.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@lv).to be_valid
  end
  
end
