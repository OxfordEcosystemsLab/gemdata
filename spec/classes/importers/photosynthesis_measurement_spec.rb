require 'spec_helper'
require 'csv'
require 'importer'

describe PhotosynthesisMeasurementImporter do
  it_behaves_like 'Importer'

  before :each do
    @leaf = set_up_leaf('ESP01', 'T13', 'B1S', 'L3', 1)
  end

  it 'can read CSV' do
    values = CSV.parse_line 'ESP01-T13-B1S-L3,ESP01-T13-B1S-L3,0,AMAX,11/05/13,NA,9.391702128,0.090896959,0.070659574,0.000663213,756.2978723,0.725085106,0.756148936,15.01,15.80085106,1000.259574,988.1531915,13.40459574,14.2606383,57.35446809,61.02319149,1199,73.31'
    importer = PhotosynthesisMeasurementImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    pm = importer.object.reload
    expect(pm.leaf).to eq(@leaf)
    expect(pm.filename).to eq('ESP01-T13-B1S-L3')
    expect(pm.code).to eq('ESP01-T13-B1S-L3')
    expect(pm.area_corr).to eq(0)
    expect(pm.pm_type).to eq('AMAX')
    expect(pm.date).to eq(Date.parse('2013-05-11'))
    expect(pm.time).to eq(nil)
    expect(pm.photosynthesis).to eq(9.391702128)
    expect(pm.photosynthesis_std).to eq(0.090896959)
    expect(pm.conductance).to eq(0.070659574)
    expect(pm.conductance_std).to eq(0.000663213)
    expect(pm.internal_co2).to eq(756.2978723)
    expect(pm.transpiration).to eq(0.725085106)
    expect(pm.vpd).to eq(0.756148936)
    expect(pm.air_temp).to eq(15.01)
    expect(pm.leaf_temp).to eq(15.80085106)
    expect(pm.co2_reference).to eq(1000.259574)
    expect(pm.co2_sample).to eq(988.1531915)
    expect(pm.water_reference).to eq(13.40459574)
    expect(pm.water_sample).to eq(14.2606383)    
    expect(pm.rh_reference).to eq(57.35446809)    
    expect(pm.rh_sample).to eq(61.02319149)
    expect(pm.par_in).to eq(1199)
    expect(pm.pressure).to eq(73.31)
    expect(pm.batch_id).to eq(1) # or is that 2? ... we'll find out in a minute
  end

  # individual validators are tested in:
  # ./gemdata/spec/models/photosynthesis_measurement_spec.rb
  it 'performs validation' do
    values = CSV.parse_line 'rubbish,ESP01-T13-B1S-L3,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish'
    # The code reader should deal with bad codes more elegantly than it does
    importer = PhotosynthesisMeasurementImporter.new(1, 1)
    expect{importer.read_row(values, Array.new)}.to raise_error
  end
  
end
