require 'spec_helper'

describe WoodDensityImporter do

  before :each do
    @branch = CodeReader.new('ACJ01-T802-B1S,CC1,6.24').find_or_create_branch
  end

  it 'can read CSV' do
    importer = WoodDensityImporter.new
    importer.read_csv 'Acjnaco,20/05/2013,Omayra,ACJ01-T802-B1S,CC1,6.24'
    wood = importer.get_object

    expect(wood.branch).to eq(@branch)
    expect(wood.date).to eq(Date.new(2013,05,20))
    expect(wood.evaluator).to eq('Omayra')
    expect(wood.branch_number).to eq('CC1')
    expect(wood.volume).to eq(6.24)
    expect(wood).to be_valid
  end

  it 'performs validation' do
    importer = WoodDensityImporter.new
    importer.read_csv 'Acjnaco,20/05/2013,Omayra,ACJ01-T802-B1S,EC9,,'
    wood = importer.get_object

    expect(wood).to_not be_valid
    expect(wood).to have(1).error_on(:branch_number)
    expect(wood).to have(2).error_on(:volume)
  end
end
