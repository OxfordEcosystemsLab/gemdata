require 'spec_helper'
require 'csv'
require 'importer'

describe WoodDensityImporter do
  it_behaves_like 'Importer'

  before :each do
    @branch = set_up_branch('ACJ01', 'T802', 'B1S')
  end

  it 'can read CSV' do

    values = CSV.parse_line 'Acjnaco,20/05/2013,Omayra,ACJ01-T802-B1S,CC1,6.24'
    importer = WoodDensityImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    wood = importer.object
    expect(wood.branch).to eq(@branch)
    expect(wood.date).to eq(Date.new(2013,05,20))
    expect(wood.evaluator).to eq('Omayra')
    expect(wood.branch_number).to eq('CC1')
    expect(wood.volume).to eq(6.24)
    expect(wood).to be_valid
  end

  it 'performs validation' do

    values = CSV.parse_line 'Acjnaco,20/05/2013,Omayra,ACJ01-T802-B1S,EC9,,'
    importer = WoodDensityImporter.new(1, 2)

    expect{importer.read_row(values, Array.new)}.to raise_error

    wood = importer.object
    expect(wood).to_not be_valid
    expect(wood).to have(1).error_on(:branch_number)
    expect(wood).to have(2).error_on(:volume)

  end
end
