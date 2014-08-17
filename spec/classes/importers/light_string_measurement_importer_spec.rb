require 'spec_helper'
require 'csv'
require 'importer'

describe LightStringMeasurementImporter do
  it_behaves_like 'Importer'

  before :each do
    @tree = set_up_tree('SPD01', 'T187')
    @light_hanging = LightHanging.create!(
      :tree  => @tree,
      :start  => Time.utc(2013, 06, 8, 8, 0, 0),
      :finish => Time.utc(2013, 07, 9, 18, 0, 0),
      :weather_reading => WeatherReading.new,
      :batch => Batch.new
    )
  end

  it 'can read CSV' do
    values = CSV.parse_line '"65210",2013-06-09 16:30:10,9674,1.359,1.291,NA,1.563,2.174,NA,1.631,2.174,NA,1.97,2.31,NA,2.174,1.834,NA,0.611,NA,0.883,0.611,NA,0.204,0,NA,0.136,0.136,NA,0,0,NA,NA,NA,NA'

    importer = LightStringMeasurementImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    lsm = importer.object.reload
    expect(lsm.light_hanging).to eq(@light_hanging)
    expect(lsm.datetime).to eq(Time.utc(2013, 6, 9, 16, 30, 10))
    expect(lsm.m0).to eq(1.359)
    expect(lsm.m0_5).to eq(1.291)
    expect(lsm.m1).to be_nil
    expect(lsm.m12).to eq(0.883)
    expect(lsm.m21).to eq(0)
    expect(lsm.m26).to be_nil

    expect(lsm).to be_valid
  end

end

