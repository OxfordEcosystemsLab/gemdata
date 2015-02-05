require 'spec_helper'
require 'csv'
require 'importer'

describe PhotosynthesisMeasurementImporter do
  it_behaves_like 'Importer'

  before :each do
    @leaf_part = set_up_leaf_part('ESP01', 'T1', 'B1S', 'L1', '00')
  end

  it 'can read CSV' do
    values = CSV.parse_line 'ESP01-T1-B1S-L1,ESP01-T1-B1S-L1,0,AMAX,09/05/13,10:23:13,13.85957447,0.090071408,0.025293617,0.000146561,76.91489362,0.668085106,1.908085106,15.35957447,23.21085106,1000.172766,982.7297872,12.1016383,12.89434043,50.78212766,54.10851064,1200,73.5'
    importer = PhotosynthesisMeasurementImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    pm = importer.object.reload
    expect(pm.leaf_part).to eq(@leaf_part)
    expect(pm.filename).to eq('ESP01-T1-B1S-L1')
    expect(pm.code).to eq('ESP01-T1-B1S-L1')
    expect(pm.area_corr).to eq(0)
    expect(pm.pm_type).to eq('AMAX')
    expect(pm.date).to eq(Date.parse('2013-05-09'))
    expect(pm.time).to eq(Time.parse('2000-01-01 10:23:13'))
    expect(pm.photosynthesis).to eq(13.85957447)
    expect(pm.photosynthesis_std).to eq(0.090071408)
    expect(pm.conductance).to eq(0.025293617)
    expect(pm.conductance_std).to eq(0.000146561)
    expect(pm.internal_co2).to eq(76.91489362)
    expect(pm.transpiration).to eq(0.668085106)
    expect(pm.vpd).to eq(1.908085106)
    expect(pm.air_temp).to eq(15.35957447)
    expect(pm.leaf_temp).to eq(23.21085106)
    expect(pm.co2_reference).to eq(1000.172766)
    expect(pm.co2_sample).to eq(982.7297872)
    expect(pm.water_reference).to eq(12.1016383)
    expect(pm.water_sample).to eq(12.89434043)    
    expect(pm.rh_reference).to eq(50.78212766)
    expect(pm.rh_sample).to eq(54.10851064)
    expect(pm.par_in).to eq(1200)
    expect(pm.pressure).to eq(73.5)
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
