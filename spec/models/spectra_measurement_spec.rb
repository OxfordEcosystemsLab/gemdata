require 'spec_helper'

describe SpectraMeasurement do

  before :each do
    @sm = SpectraMeasurement.new
    @sm.leaf_part = set_up_leaf_part('ESP-01', 'T94', 'B11H', 'L5', 'L')
    @sm.comments = 'Yohoho'
    @sm.measurement_type = 'tl_ref'
    @sm.original_code = 'ESP01-T94-B11H-L5-C1'
    @sm.matlab_branch_code = 'Esp01-T94-B11H'
    @sm.branch_number = 1
    @sm.leaf_number = 3
    @sm.quality_check = 1
    for m in 350..1100 do
      @sm["measurement_#{m}"] = 0.535356
    end
    @sm.batch = Batch.new
  end

  it 'is not valid on its own' do
    expect(SpectraMeasurement.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@sm).to be_valid
  end

  it 'is not valid without a branch_number' do
    @sm.branch_number = nil
    expect(@sm).to_not be_valid
  end

  it 'is not valid without a leaf_number' do
    @sm.leaf_number = nil
    expect(@sm).to_not be_valid
  end

  it 'is not valid without a leaf_part' do
    @sm.leaf_part = nil
    expect(@sm).to_not be_valid
  end

  it 'is not valid without a first measurement' do
    @sm.measurement_350 = nil
    expect(@sm).to_not be_valid
  end

  it 'should accept four measurement_types' do
    ['tl_ref', 'tl_trans', 'bl_ref', 'bl_trans'].each do |measurement_type|
      @sm.measurement_type = measurement_type
      expect(@sm).to be_valid
    end

    @sm.measurement_type = 'boogaloo'
    expect(@sm).to_not be_valid
  end

end

