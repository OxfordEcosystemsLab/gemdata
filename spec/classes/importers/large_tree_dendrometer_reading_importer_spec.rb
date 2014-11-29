require 'spec_helper'
require 'csv'
require 'importer'

describe LargeTreeDendrometerReadingImporter do
  it_behaves_like 'Importer'

  before :each do
    @tree = set_up_tree('ESP-01', '708', '25')
  end

  it 'can read CSV' do
    values = CSV.parse_line 'ESP-01,25,708,2014,3,16,,8.95,,,,'

    importer = LargeTreeDendrometerReadingImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    o = importer.object.reload

    expect(o.tree).to eq(@tree)
    expect(o.date).to eq(Date.parse('2014-03-16'))
    expect(o.dendrometer_reading_mm).to eq(8.95)

    expect(o).to be_valid
  end

end
