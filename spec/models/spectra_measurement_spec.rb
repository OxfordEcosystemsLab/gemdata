require 'spec_helper'

describe SpectraMeasurement do

  before :each do
    @sm = SpectraMeasurement.new

    @sm.leaf     = Leaf.create(:code => 'L1L')
    @sm.branch   = '4'
    @sm.comments = 'Yohoho'
    @sm.order    = '4'
    @sm.type     = 'top_ref'
    @sm.measurement_350 = 0.535356
    @sm.batch    = Batch.new
  end

  it 'is not valid on its own' do
    expect(SpectraMeasurement.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@sm).to be_valid
  end

  it 'is not valid without a branch' do
    @sm.branch = nil
    expect(@sm).to_not be_valid
  end

  it 'is not valid without a order' do
    @sm.order = nil
    expect(@sm).to_not be_valid
  end

  it 'is not valid without a leaf' do
    @sm.leaf = nil
    expect(@sm).to_not be_valid
  end

  it 'is not valid without a first measuremtn' do
    @sm.measurement_350 = nil
    expect(@sm).to_not be_valid
  end

  it 'should accept four types' do
    ['top_ref', 'top_trans', 'bottom_ref', 'bottom_trans'].each do |type|
      @sm.type = type
      expect(@sm).to be_valid
    end

    @sm.type = 'boogaloo'
    expect(@sm).to_not be_valid
  end

end

