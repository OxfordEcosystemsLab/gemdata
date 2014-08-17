require 'spec_helper'
require 'csv'
require 'importer'

describe BranchLightPlacementImporter do
  it_behaves_like 'Importer'

  before :each do
    @branch = set_up_branch('TAM05', 'T37', 'B11H')
    @weather_reading = WeatherReading.create!(
      :plot     => @branch.tree.sub_plot.plot,
      :datetime => Time.utc(2013, 8, 16, 10, 51, 0),
      :batch    => Batch.new
    )
  end

  it 'can read CSV' do
    values = CSV.parse_line '659,TAM05-T37-B11H,sombra,100-0185,100-0186,100-0187,5.3,1.15,0,219,161,23,5,23.1,5DS,80,(-)4:17,8/16/2013 10:51,8/16/2013 10:51'

    importer = BranchLightPlacementImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    @blp = importer.object
    expect(@blp.branch).to eq(@branch)
    expect(@blp.weather_reading).to eq(@weather_reading)

    expect(@blp.sun_shade).to eq('SOMBRA')
    expect(@blp.pic1).to eq('100-0185')
    expect(@blp.pic2).to eq('100-0186')
    expect(@blp.pic3).to eq('100-0187')
    expect(@blp.hd_pic).to eq(5.3)
    expect(@blp.alt_pic).to eq(1.15)
    expect(@blp.angle_pic).to eq(0)
    expect(@blp.az_pic).to eq(219)
    expect(@blp.az_branch).to eq(161)
    expect(@blp.vd_branch).to eq(23)
    expect(@blp.hd_branch).to eq(5)
    expect(@blp.vground_branch).to eq(23.1)
    expect(@blp.light_cond).to eq('5DS')
    expect(@blp.liana_cov).to eq(80)
    expect(@blp.note).to eq('(-)4:17')
    expect(@blp.start).to  eq(Time.utc(2013, 8, 16, 10, 51, 0))
    expect(@blp.finish).to eq(Time.utc(2013, 8, 16, 10, 51, 0))

    expect(@blp).to be_valid
  end

end

