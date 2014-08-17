require 'spec_helper'
require 'csv'
require 'importer'

describe BranchLightMeasurementImporter do
  it_behaves_like 'Importer'

  before :each do
    @branch = set_up_branch('SPD01', 'T187', 'B13')
    @branch_light_placement = BranchLightPlacement.create!(
      :branch  => @branch,
      :start  => Time.utc(2013, 5, 8, 6, 0, 0),
      :finish => Time.utc(2013, 5, 8, 9, 0, 0),
      :weather_reading => WeatherReading.new,
      :batch => Batch.new
    )
  end

  it 'can read CSV' do
    values = CSV.parse_line '"3",1,2013-05-08 07:00:00,0.00183,1.70339328'

    importer = BranchLightMeasurementImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    blm = importer.object
    expect(blm.branch_light_placement).to eq(@branch_light_placement)
    expect(blm.datetime).to eq(Time.utc(2013, 5, 8, 7, 0, 0))
    expect(blm.number).to eq(1)
    expect(blm.measurement).to eq(0.00183)
    expect(blm.photons).to eq(1.70339328)

    expect(blm).to be_valid
  end

end

