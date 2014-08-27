require 'spec_helper'

describe LightStringMeasurement do

  before :each do
    @lsm = LightStringMeasurement.new
    @lsm.light_hanging = LightHanging.new
    @lsm.datetime = Time.utc(2014, 06, 06, 06, 06, 06)
    @lsm.record = 134567
    @lsm.m0 = 1.359
    @lsm.m10 = 0.611
    @lsm.m26 = 0.123
    @lsm.batch = Batch.new
  end

  it 'can be valid' do
    expect(@lsm).to be_valid
  end

  it 'is not valid on its own' do
    expect(LightStringMeasurement.new).to_not be_valid
  end

  it 'is not valid without a record' do
    @lsm.record = nil
    expect(@lsm).to_not be_valid
  end

  it 'is not valid without a date' do
    @lsm.datetime = nil
    expect(@lsm).to_not be_valid
  end

end
