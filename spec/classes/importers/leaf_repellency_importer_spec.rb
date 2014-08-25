require 'spec_helper'
require 'csv'
require 'importer'

describe LeafRepellencyImporter do
  it_behaves_like 'Importer'

  before :each do
    @branch = set_up_branch('ACJ01', 'T733', 'B3S')
  end

  it 'can read CSV with leaf code L' do
    values = CSV.parse_line 'ACJ,ACJ01-T733-B3S,L1,5237,'

    importer = LeafRepellencyImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    lr = importer.object.reload
    expect(lr.branch).to eq(@branch)
    expect(lr.replica).to eq('L1')
    expect(lr.photo_number).to eq(5237)
    expect(lr.angle).to be_nil

    expect(lr).to be_valid
  end

end
