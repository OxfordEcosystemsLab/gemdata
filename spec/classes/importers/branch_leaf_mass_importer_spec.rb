require 'spec_helper'
require 'csv'
require 'importer'

describe BranchLeafMassImporter do
  it_behaves_like 'Importer'

  it 'can read CSV' do
    branch = set_up_branch('ACJ-01', 'T816', 'B11H', 1)
    values = CSV.parse_line 'Omayra,2013-05-13,ACJ01-T816-B11H-Ar,ACJ01-T816-B11H-Ar,188.45,NA,g,"Surely, you`re joshing me officer"'
    importer = BranchLeafMassImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    blm = importer.object.reload
    expect(blm).to be_valid
    expect(blm.branch).to eq(branch)
    expect(blm.person).to eq('Omayra')
    expect(blm.date).to eq(Date.new 2013, 5, 13)
    expect(blm.original_branchcode).to eq('ACJ01-T816-B11H-Ar')
    expect(blm.leaf_weight).to eq(188.45)
    expect(blm.leaf_rachis_weight).to eq(nil)
    expect(blm.quality_flag).to eq('g')
    expect(blm.comments).to eq('Surely, you`re joshing me officer')
  end

end
