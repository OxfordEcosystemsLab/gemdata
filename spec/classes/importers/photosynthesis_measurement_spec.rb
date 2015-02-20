require 'spec_helper'
require 'csv'
require 'importer'

describe PhotosynthesisMeasurementImporter do
  it_behaves_like 'Importer'

  it 'can read CSV' do
    leaf_part = set_up_leaf_part('ESP-01', 'I2005', 'B1S', 'L1', 'L0S')
    values = CSV.parse_line '"ESP01-I2005-B1S-L1","ESP01-I2005-B1S-L1",NA,"g",NA,"AMAX",1000.25957446808,2013-05-11,1899-12-31 08:20:36,9.39170212765957,0.09089695907613,0.0706595744680851,0.000663213381121918,756.297872340426,0.725085106382979,0.756148936170213,15.01,15.8008510638298,1000.25957446808,988.153191489362,13.4045957446809,14.2606382978723,57.3544680851064,61.0231914893617,1199,73.31'
    importer = PhotosynthesisMeasurementImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    pm = importer.object.reload
    expect(pm.leaf_part).to eq(leaf_part)
    expect(pm.batch_id).to eq(1)
    expect(pm.filename).to eq('ESP01-I2005-B1S-L1')
    expect(pm.code).to eq('ESP01-I2005-B1S-L1')
    expect(pm.comment).to eq(nil)
    expect(pm.quality_flag).to eq('g')
    expect(pm.area_corr).to eq(nil)
    expect(pm.pm_type).to eq('AMAX')
    # CO2R - 1000.25957446808
    expect(pm.date).to eq(Date.parse('2013-05-11'))
    expect(pm.time).to eq(Time.parse('2000-01-01 08:20:36'))
    expect(pm.photosynthesis).to eq(9.39170212765957)
    expect(pm.photosynthesis_std).to eq(0.09089695907613)
    expect(pm.conductance).to eq(0.0706595744680851)
    expect(pm.conductance_std).to eq(0.000663213381121918)
    expect(pm.internal_co2).to eq(756.297872340426)
    expect(pm.transpiration).to eq(0.725085106382979)
    expect(pm.vpd).to eq(0.756148936170213)
    expect(pm.air_temp).to eq(15.01)
    expect(pm.leaf_temp).to eq(15.8008510638298)
    expect(pm.co2_reference).to eq(1000.25957446808)
    expect(pm.co2_sample).to eq(988.153191489362)
    expect(pm.water_reference).to eq(13.4045957446809)
    expect(pm.water_sample).to eq(14.2606382978723)
    expect(pm.rh_reference).to eq(57.3544680851064)
    expect(pm.rh_sample).to eq(61.0231914893617)
    expect(pm.par_in).to eq(1199)
    expect(pm.pressure).to eq(73.31)
  end

  it 'allows time to be NA' do
    leaf_part = set_up_leaf_part('ESP-01', 'I2005', 'B1S', 'L1', 'L0S')
    values = CSV.parse_line '"ESP01-I2005-B1S-L1","ESP01-I2005-B1S-L1",NA,"g",NA,"AMAX",1000.25957446808,2013-05-11,NA,9.39170212765957,0.09089695907613,0.0706595744680851,0.000663213381121918,756.297872340426,0.725085106382979,0.756148936170213,15.01,15.8008510638298,1000.25957446808,988.153191489362,13.4045957446809,14.2606382978723,57.3544680851064,61.0231914893617,1199,73.31'
    importer = PhotosynthesisMeasurementImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    pm = importer.object.reload
    expect(pm.time).to eq(nil)
  end

  it 'processes leaf parts correctly' do
    leaf_part = set_up_leaf_part('ESP-01', 'I2005', 'B1S', 'L1', 'L1C')
    values = CSV.parse_line '"ESP01-I2005-B1S-L1","ESP01-I2005-B1S-L1C1",NA,"g",NA,"AMAX",1000.25957446808,2013-05-11,NA,9.39170212765957,0.09089695907613,0.0706595744680851,0.000663213381121918,756.297872340426,0.725085106382979,0.756148936170213,15.01,15.8008510638298,1000.25957446808,988.153191489362,13.4045957446809,14.2606382978723,57.3544680851064,61.0231914893617,1199,73.31'
    importer = PhotosynthesisMeasurementImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    pm = importer.object.reload
    expect(pm.leaf_part).to eq(leaf_part)
  end

  # individual validators are tested in:
  # ./gemdata/spec/models/photosynthesis_measurement_spec.rb
  it 'performs validation' do
    leaf_part = set_up_leaf_part('ESP-01', 'I2005', 'B1S', 'L1', 'L1C')
    values = CSV.parse_line 'rubbish,"ESP01-I2005-B1S-L1",rubbish,trash,NA,"AMAX",junk,bunk,tosh,refuse,waste,ash,matter,sewerage,trash,junk,bunkum,tosh,bosh,funk,garbage,junk,rubbish,rubbish,rubbish,rubbish'
    # The code reader should deal with bad codes more elegantly than it does
    importer = PhotosynthesisMeasurementImporter.new(1, 1)
    expect{importer.read_row(values, Array.new)}.to raise_error
  end
  
end
