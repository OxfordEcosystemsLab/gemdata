require 'spec_helper'

describe WoodDensity do
  before :each do
    @branch = CodeReader.new('ACJ01-T802-B1S,CC1,6.24').find_or_create_branch
  end

  it 'is not valid on its own' do
    expect(WoodDensity.new).to_not be_valid
  end

  it 'can read CSV' do
    csv = 'Acjnaco,20/05/2013,Omayra,ACJ01-T802-B1S,CC1,6.24'
    wood = WoodDensity.new
    wood.read_csv csv
    expect(wood.branch).to eq(@branch)
    expect(wood.date).to eq(Date.new(2013,05,20))
    expect(wood.evaluator).to eq('Omayra')
    expect(wood.branch_number).to eq('CC1')
    expect(wood.volume).to eq(6.24)
    expect(wood).to be_valid
  end

  it 'performs validation' do
    csv = 'Acjnaco,20/05/2013,Omayra,ACJ01-T802-B1S,EC9,,'
    wood = WoodDensity.new
    wood.read_csv csv
    expect(wood).to_not be_valid
    expect(wood.errors).to have(1).error_on(:branch_number)
    expect(wood.errors).to have(1).error_on(:volume)
  end
end
