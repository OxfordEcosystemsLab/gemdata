require 'spec_helper'
require 'csv'
require 'importer'

describe WeatherReadingImporter do
  it_behaves_like 'Importer'

  before :each do
    @plot = set_up_plot 'SPD-01'
  end

  it 'can read csv' do
    values = CSV.parse_line '1,SPD01,1,A,S,"NUBLADO CON NIEBLA, LUZ DIFUSA",Allie added climate codes based on description,6/18/2013 11:15:03'

    importer = WeatherReadingImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    wr = importer.object.reload
    expect(wr.plot).to eq(@plot)
    expect(wr.datetime).to eq(Time.new(2013, 06, 18, 11, 15, 3))
    expect(wr.clouds).to eq(1)
    expect(wr.light).to eq('A')
    expect(wr.rain).to eq('S')
    expect(wr.note).to eq('NUBLADO CON NIEBLA, LUZ DIFUSA')
    expect(wr.second_note).to eq('Allie added climate codes based on description')

    expect(wr).to be_valid
  end
end
