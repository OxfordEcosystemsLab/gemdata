require 'spec_helper'
require 'csv'
require 'importer'

describe PhotosynthesisCurveImporter do
  it_behaves_like 'Importer'

  it 'can read CSV' do
    leaf_part = set_up_leaf_part('PAN-02', 'T498', 'B1S', 'L6', 'L1C')
    values = CSV.parse_line '"PAN02-T498-B1S-CO2curve","PAN02-T498-B1S-L6C1",NA,"g",0,"CO2",1,"25/10/2013","10:50:57",15.9,0,0.0808,0,830,1.28,1.5,27.75,28.13,1198.42,1177.59,22.941,24.439,58.42,62.15,1500,95.11'
    importer = PhotosynthesisCurveImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    pc = importer.object.reload
    expect(pc.leaf_part).to eq(leaf_part)
    expect(pc.batch_id).to eq(1)
    expect(pc.filename).to eq('PAN02-T498-B1S-CO2curve')
    expect(pc.code).to eq('PAN02-T498-B1S-L6C1')
    expect(pc.comment).to eq(nil)
    expect(pc.quality_flag).to eq('g')
    expect(pc.area_corr).to eq(0)
    expect(pc.data_type).to eq('CO2')
    expect(pc.reading).to eq(1)
    expect(pc.date).to eq(Date.parse('2013-10-25'))
    expect(pc.time).to eq(Time.parse('2000-01-01 10:50:57'))
    expect(pc.photosynthesis).to eq(15.9)
    expect(pc.photosynthesis_std).to eq(0)
    expect(pc.conductance).to eq(0.0808)
    expect(pc.conductance_std).to eq(0)
    expect(pc.internal_co2).to eq(830)
    expect(pc.transpiration).to eq(1.28)
    expect(pc.vpd).to eq(1.5)
    expect(pc.air_temp).to eq(27.75)
    expect(pc.leaf_temp).to eq(28.13)
    expect(pc.co2_reference).to eq(1198.42)
    expect(pc.co2_sample).to eq(1177.59)
    expect(pc.water_reference).to eq(22.941)
    expect(pc.water_sample).to eq(24.439)
    expect(pc.rh_reference).to eq(58.42)
    expect(pc.rh_sample).to eq(62.15)
    expect(pc.par_in).to eq(1500)
    expect(pc.pressure).to eq(95.11)
  end

  it 'processes leaf parts correctly' do
    leaf_part = set_up_leaf_part('PAN-02', 'T498', 'B1S', 'L6', 'L0S')
    values = CSV.parse_line '"PAN02-T498-B1S-CO2curve","PAN02-T498-B1S-L6",NA,"g",0,"CO2",1,"25/10/2013","10:50:57",15.9,0,0.0808,0,830,1.28,1.5,27.75,28.13,1198.42,1177.59,22.941,24.439,58.42,62.15,1500,95.11'
    importer = PhotosynthesisCurveImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    pc = importer.object.reload
    expect(pc.leaf_part).to eq(leaf_part)
  end

  # individual validators are tested in:
  # ./gemdata/spec/models/photosynthesis_Curve_spec.rb
  it 'performs validation' do
    leaf_part = set_up_leaf_part('ESP-01', 'I2005', 'B1S', 'L1', 'L1C')
    values = CSV.parse_line 'rubbish,"ESP01-I2005-B1S-L1",rubbish,trash,NA,"AMAX",junk,bunk,tosh,refuse,waste,ash,matter,sewerage,trash,junk,bunkum,tosh,bosh,funk,garbage,junk,rubbish,rubbish,rubbish,rubbish'
    # The code reader should deal with bad codes more elegantly than it does
    importer = PhotosynthesisCurveImporter.new(1, 1)
    expect{importer.read_row(values, Array.new)}.to raise_error
  end
  
end
