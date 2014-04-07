require 'spec_helper'

describe BranchArchitecture do

  before :each do
    @branch = CodeReader.new('SPD01-T1159-B1S').find_or_create_branch
  end
  
  it 'is not valid on its own' do
    expect(BranchArchitecture.new).to_not be_valid
  end

  it 'can read CSV' do
    csv = 'San Pedro I,09/06/2013,"Milenka, Tatiana",SPD01-T1159-B1S,Inga indet.,1,Base,NO,12.24,10.9,118.9,Test comment'
    b = BranchArchitecture.new
    b.read_csv csv
    expect(b).to be_valid
    expect(b.date).to eq(Date.new '2013-06-09')
    expect(b.evaluator).to eq('"Milenka, Tatiana"')
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
    csv = 'San Pedro I,09/06/2013,"Milenka, Tatiana",SPD01-T1159-B1S,Inga indet.,4,3,N,-,-,-,'
    b = BranchArchitecture.new
    b.read_csv csv
    expect(b).to be_valid
    expect(b.diam_inf).to be_nil
    expect(b.diam_sup).to be_nil
    expect(b.longitude).to be_nil
  end

  it 'validates absence of measurements on node tip' do
    csv = 'San Pedro I,09/06/2013,"Milenka, Tatiana",SPD01-T1159-B1S,Inga indet.,1,Base,N,12.24,10.9,118.9,'
    b = BranchArchitecture.new
    b.read_csv csv
    expect(b).to_not be_valid
    expect(b.errors).to include('diam_inf', 'diam_sup', 'longitude')
  end
end
