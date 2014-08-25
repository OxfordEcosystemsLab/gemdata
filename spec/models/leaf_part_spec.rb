require 'spec_helper'

describe LeafPart do

  before :each do
    @lp = LeafPart.new
    @lp.leaf = Leaf.new
    @lp.code = '130822-OK'
    @lp.batch = Batch.new
  end

  it 'is not valid on its own' do
    expect(LeafPart.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@lp).to be_valid
  end

  it 'it should not be valid without a leaf' do
    @lp.leaf = nil
    expect(@lp).to_not be_valid
  end

  it 'it should not be valid without a code' do
    @lp.code = nil
    expect(@lp).to_not be_valid
  end

end
