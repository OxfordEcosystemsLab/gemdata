require 'spec_helper'

describe LeafArea do

  before :each do
    @la = LeafArea.new
    @la.leaf_part = LeafPart.new
    @la.date = Date.new(2014,4,5)
    @la.person = 'GUANYIN'
    @la.area = 232808.67
    @la.batch = Batch.new
  end

  it 'is not valid on its own' do
    expect(LeafArea.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@la).to be_valid
  end

  it 'it should not be valid without a leaf part' do
    @la.leaf_part = nil
    expect(@la).to_not be_valid
  end

  it 'it should not be valid without a date' do
    @la.date = nil
    expect(@la).to_not be_valid
  end

  it 'it should not be valid without a area' do
    @la.area = nil
    expect(@la).to_not be_valid
  end

end
