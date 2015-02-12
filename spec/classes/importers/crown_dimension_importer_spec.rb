require 'spec_helper'
require 'csv'
require 'importer'

describe CrownDimensionImporter do
  it_behaves_like 'Importer'

  before :each do
    @tree = set_up_tree('ACJ-01', 'I2014')
  end

  it 'can read CSV' do
    values = CSV.parse_line '"1","ACJ01-I2014",8.2,10.7,12.09716360806,179.856655603351,3.44700364273712,224.427154296548,"ACJ01"'
    importer = CrownDimensionImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    cd = importer.object.reload
    expect(cd.tree).to eq(@tree)
    expect(cd.depth).to eq(8.2)
    expect(cd.h_tree).to eq(10.7)
    expect(cd.width_max).to eq(12.09716360806)
    expect(cd.vol).to eq(179.856655603351)
    expect(cd.poly_vol).to eq(3.44700364273712)
    expect(cd.surf_area).to eq(224.427154296548)
    expect(cd.batch_id).to eq(1)
    expect(cd).to be_valid
  end

end

