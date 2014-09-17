require 'spec_helper'
require 'csv'
require 'importer'

describe CrownDimensionImporter do
  it_behaves_like 'Importer'

  before :each do
    @tree = set_up_tree('ESP01', 'T32')
  end

  it 'can read CSV' do
    values = CSV.parse_line '"47","ESP01-T32",3.9,8.80477651747658,282.293995428428,"ESP01"'

    importer = CrownDimensionImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    cd = importer.object.reload
    expect(cd.tree).to eq(@tree)
    expect(cd.depth).to eq(3.9)
    expect(cd.width_max).to eq(8.80477651747658)
    expect(cd.vol).to eq(282.293995428428)

    expect(cd).to be_valid
  end

end

