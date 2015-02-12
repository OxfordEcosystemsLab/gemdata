require 'spec_helper'
require 'csv'
require 'importer'

describe LeafVenationImporter do
  it_behaves_like 'Importer'

  it 'can read CSV' do
    leaf_part = set_up_leaf_part('ACJ-01', 'I2014', 'B1S', 'L1', 'S')
    values = CSV.parse_line 'ACJ01-I2014-S,ACJ01-I2014-B1S-L1S,ACJ01-I2014-B1S-L1S-CLAHE.jpg,ACJ01-I2014-B1S-L1S-TRACED.png,ACJ01-I2014-B1S-L1S-VEINS.png,ACJ01-I2014-B1S-L1S-AREOLES.png,ACJ01-I2014-B1S-L1S-VERTEXLIST.csv,ACJ01-I2014-B1S-L1S-EDGELIST.csv,ACJ01-I2014-B1S-L1S-EDGEPERIMS.csv,ACJ01-I2014-B1S-L1S-EDGERADII.csv,ACJ01-I2014-B1S,ACJ01-I2014,ACJ01,sun,ASTERACEAE,Pentacalia,oronocensis,Asteraceae/Pentacalia/oronocensis,TRUE,TRUE,76.6393,12.0705,0.24921,0.19562,1.4586,0.45884,0.64191,1.6564,0.46877,18.5919,6.0478,20.0908,0.17241,0.41375,0.034277654,0.009118994'
    importer = LeafVenationImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    
    lv = importer.object.reload
    expect(lv.leaf_part).to eq(leaf_part)
    expect(lv.census_comparable_branch_code).to eq('ACJ01-I2014-S')
    expect(lv.image_enhanced).to eq('ACJ01-I2014-B1S-L1S-CLAHE.jpg')
    expect(lv.image_traced).to eq('ACJ01-I2014-B1S-L1S-TRACED.png')
    expect(lv.image_veins_fitted).to eq('ACJ01-I2014-B1S-L1S-VEINS.png')
    expect(lv.image_areoles_fitted).to eq('ACJ01-I2014-B1S-L1S-AREOLES.png')
    expect(lv.image_data_vertex_list).to eq('ACJ01-I2014-B1S-L1S-VERTEXLIST.csv')
    expect(lv.image_data_edge_list).to eq('ACJ01-I2014-B1S-L1S-EDGELIST.csv')
    expect(lv.image_data_edge_perims).to eq('ACJ01-I2014-B1S-L1S-EDGEPERIMS.csv')
    expect(lv.image_data_edge_radii).to eq('ACJ01-I2014-B1S-L1S-EDGERADII.csv')
    expect(lv.vein_image_good).to eq(true)
    expect(lv.vein_area_analyzed).to eq(76.6393)
    expect(lv.vein_density).to eq(12.0705)
    expect(lv.vein_length_mean).to eq(0.24921)
    expect(lv.vein_length_sd).to eq(0.19562)
    expect(lv.vein_tortuosity_mean).to eq(1.4586)
    expect(lv.vein_tortuosity_sd).to eq(0.45884)
    expect(lv.vein_minimum_spanning_tree_ratio).to eq(0.64191)
    expect(lv.vein_areole_elongation_ratio_mean).to eq(1.6564)
    expect(lv.vein_areole_elongation_ratio_sd).to eq(0.46877)
    expect(lv.vein_areole_roughness_mean).to eq(18.5919)
    expect(lv.vein_areole_roughness_sd).to eq(6.0478)
    expect(lv.vein_areole_loopiness).to eq(20.0908)
    expect(lv.vein_freely_ending_veinlet_ratio).to eq(0.17241)
    expect(lv.vein_area_fraction).to eq(0.41375)
    expect(lv.vein_thickness_mean_weighted).to eq(0.034277654)
    expect(lv.vein_thickness_sd_weighted).to eq(0.009118994)
    expect(lv.batch_id).to eq(1)
  end

  it 'allows most fields to be NA' do
    leaf_part = set_up_leaf_part('PAN-02', 'T498', 'B11H', 'L1', 'P')
    values = CSV.parse_line 'PAN02-T498-H,PAN02-T498-B11H-L1P,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,TRUE,FALSE,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA'
    importer = LeafVenationImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    
    lv = importer.object.reload
    expect(lv.leaf_part).to eq(leaf_part)
    expect(lv.census_comparable_branch_code).to eq('PAN02-T498-H')
    expect(lv.image_enhanced).to eq(nil)
    expect(lv.image_traced).to eq(nil)
    expect(lv.image_veins_fitted).to eq(nil)
    expect(lv.image_areoles_fitted).to eq(nil)
    expect(lv.image_data_vertex_list).to eq(nil)
    expect(lv.image_data_edge_list).to eq(nil)
    expect(lv.image_data_edge_perims).to eq(nil)
    expect(lv.image_data_edge_radii).to eq(nil)
    expect(lv.vein_image_good).to eq(false)
    expect(lv.vein_area_analyzed).to eq(nil)
    expect(lv.vein_density).to eq(nil)
    expect(lv.vein_length_mean).to eq(nil)
    expect(lv.vein_length_sd).to eq(nil)
    expect(lv.vein_tortuosity_mean).to eq(nil)
    expect(lv.vein_tortuosity_sd).to eq(nil)
    expect(lv.vein_minimum_spanning_tree_ratio).to eq(nil)
    expect(lv.vein_areole_elongation_ratio_mean).to eq(nil)
    expect(lv.vein_areole_elongation_ratio_sd).to eq(nil)
    expect(lv.vein_areole_roughness_mean).to eq(nil)
    expect(lv.vein_areole_roughness_sd).to eq(nil)
    expect(lv.vein_areole_loopiness).to eq(nil)
    expect(lv.vein_freely_ending_veinlet_ratio).to eq(nil)
    expect(lv.vein_area_fraction).to eq(nil)
    expect(lv.vein_thickness_mean_weighted).to eq(nil)
    expect(lv.vein_thickness_sd_weighted).to eq(nil)
    expect(lv.batch_id).to eq(1)
  end

  it 'performs validation' do
    leaf_part = set_up_leaf_part('ACJ-01', 'I2014', 'B1S', 'L1', 'S')
    values = CSV.parse_line 'ACJ01-I2014-S,ACJ01-I2014-B1S-L1S,ACJ01-I2014-B1S-L1S-CLAHE.jpg,ACJ01-I2014-B1S-L1S-TRACED.png,ACJ01-I2014-B1S-L1S-VEINS.png,ACJ01-I2014-B1S-L1S-AREOLES.png,ACJ01-I2014-B1S-L1S-VERTEXLIST.csv,ACJ01-I2014-B1S-L1S-EDGELIST.csv,ACJ01-I2014-B1S-L1S-EDGEPERIMS.csv,ACJ01-I2014-B1S-L1S-EDGERADII.csv,ACJ01-I2014-B1S,ACJ01-I2014,ACJ01,sun,ASTERACEAE,Pentacalia,oronocensis,Asteraceae/Pentacalia/oronocensis,TRUE,rubbish,-1,-1,-1,-1,-1,-1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1'
    importer = LeafVenationImporter.new(1, 1)
    expect{importer.read_row(values, Array.new)}.to raise_error
  end
  
end
