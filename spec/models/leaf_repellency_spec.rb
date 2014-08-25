require 'spec_helper'

describe LeafRepellency do

  before :each do
    @lr = LeafRepellency.new
    @lr.branch = Branch.new
    @lr.replica = 'L1'
    @lr.photo_number = 3543
    @lr.angle = 'who knows?'
    @lr.batch = Batch.new
  end

  it 'is not valid on its own' do
    expect(LeafRepellency.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@lr).to be_valid
  end

  it 'should not be valid without a replica' do
    @lr.replica = nil
    expect(@lr).to_not be_valid
  end

  it 'should not be valid without a branch' do
    @lr.branch = nil
    expect(@lr).to_not be_valid
  end

end
