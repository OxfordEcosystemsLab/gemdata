require 'spec_helper'
require 'csv'
require 'importer'

describe SmallTreeDendrometerReadingImporter do
  it_behaves_like 'Importer'

  before :each do
    @tree = set_up_tree('ESP-01', '445', '13')
  end

  it 'can read CSV' do
    values = CSV.parse_line 'ESP-01,13,445,2006,1,20,NaN,5.75,1.3,11.3,,,,,,'

    importer = SmallTreeDendrometerReadingImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    o = importer.object.reload

    expect(o.tree).to eq(@tree)
    expect(o.date).to eq(Date.parse('2006-01-20'))

    expect(o.wood_density_g_m2).to be_nil
    expect(o.tree_height_m).to eq(5.75)
    expect(o.pom_height_m).to eq(1.3)
    expect(o.dbh_northsouth_cm).to eq(11.3)

    expect(o).to be_valid
  end

end
