require 'spec_helper'
require 'csv'
require 'importer'

describe BranchArchitectureImporter do
  it_behaves_like 'Importer'

  before :each do
    @branch = set_up_branch('SPD-01', 'T1159', 'B1S', 1)
  end

  it 'can read CSV' do

    values = CSV.parse_line 'San Pedro I,09/06/2013,"Milenka, Tatiana",SPD01-T1159-B1S,Inga indet.,1,Base,NO,12.24,10.9,118.9,Test comment'

    importer = BranchArchitectureImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    b = importer.object.reload
    expect(b).to be_valid
    expect(b.date).to eq(Date.new 2013, 6, 9)
    expect(b.evaluator).to eq('Milenka, Tatiana')
    expect(b.section).to eq(1)
    expect(b.parent).to eq(0)
    expect(b.tip).to eq('NO')
    expect(b.diam_inf).to eq(12.24)
    expect(b.diam_sup).to eq(10.9)
    expect(b.longitude).to eq(118.9)
    expect(b.comments).to eq('Test comment')
    expect(b.branch).to eq(@branch)
  end

  it 'can read a CSV with a node tip' do

    values = CSV.parse_line 'San Pedro I,09/06/2013,"Milenka, Tatiana",SPD01-T1159-B1S,Inga indet.,4,3,N,-,-,-,'

    importer = BranchArchitectureImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    b = importer.object
    expect(b).to be_valid
    expect(b.diam_inf).to be_nil
    expect(b.diam_sup).to be_nil
    expect(b.longitude).to be_nil
  end
end
