require 'spec_helper'
require 'csv'
require 'importer'

describe LightHangingImporter do
  it_behaves_like 'Importer'

  before :each do
    @tree = set_up_tree('SPD01', 'T187')
    @weather_reading = WeatherReading.create!(
      :plot  => @tree.sub_plot.plot,
      :datetime => Time.new(2013, 06, 14, 8, 0, 0),
      :batch => Batch.new
    )
  end

  it 'can read CSV' do
    values = CSV.parse_line '"1","SPD01","SPD01-T187",13,0.25,1.2,217,12,1.2,"EL INSTRUMENTO FALLA CONSTANTEMENTE",2013-06-13 13:52:00,2013-06-14 09:00:00'

    importer = LightHangingImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    lh = importer.object
    expect(lh.tree).to eq(@tree)
    expect(lh.weather_reading).to eq(@weather_reading)
    expect(lh.last_sensor).to eq(13)
    expect(lh.last_sensor_height).to eq(0.25)
    expect(lh.first_sensor_to_crown_top).to eq(1.2)
    expect(lh.az).to eq(217)
    expect(lh.vd).to eq(12)
    expect(lh.hd).to eq(1.2)
    expect(lh.note).to eq('EL INSTRUMENTO FALLA CONSTANTEMENTE')
    expect(lh.start).to  eq(Time.new(2013, 6, 13, 13, 52, 0, "+00:00"))
    expect(lh.finish).to eq(Time.new(2013, 6, 14,  9,  0, 0, "+00:00"))

    expect(lh).to be_valid
  end

end

