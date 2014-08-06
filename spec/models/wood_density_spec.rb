require 'spec_helper'

describe WoodDensity do

  before :each do
    @wood = WoodDensity.new
    @wood.branch = Branch.create(:code => 'B1S', :batch_id => 1)
    @wood.date = Date.new(2014,4,1)
    @wood.evaluator = 'Ben Holmes'
    @wood.branch_number = 'CC1'
    @wood.volume = 123.41
    @wood.batch = Batch.create!
  end

  it 'is not valid on its own' do
    expect(WoodDensity.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@wood).to be_valid
  end

  it 'is not valid with a dodgy branch_number' do
    @wood.branch_number = 'Bodge'
    expect(@wood).to_not be_valid
    expect(@wood).to have(1).error_on(:branch_number)
  end

  it 'is does not permit negative volume' do
    @wood.volume = -50
    expect(@wood).to_not be_valid
    expect(@wood).to have(1).error_on(:volume)
  end
end
