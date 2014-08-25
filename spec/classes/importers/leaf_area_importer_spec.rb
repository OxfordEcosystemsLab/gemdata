require 'spec_helper'
require 'csv'
require 'importer'

describe LeafAreaImporter do
  it_behaves_like 'Importer'

  before :each do
    @leaf_part = set_up_leaf_part('TAM05', 'T342', 'B11H', 'L1P', '130822.-OK', 1)
  end

  it 'can read CSV' do
    values = CSV.parse_line '130822,GUANYIN,TAM05-T342-B11H-L1P-130822.-OK,16972.5'

    importer = LeafAreaImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    la = importer.object.reload
    expect(la.leaf_part).to eq(@leaf_part)
    expect(la.person).to eq('GUANYIN')
    expect(la.date).to eq(Date.new(2013, 8, 22))
    expect(la.area).to eq(16972.5)

    expect(la).to be_valid
  end

end
