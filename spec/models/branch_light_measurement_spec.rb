require 'spec_helper'

describe BranchLightMeasurement do

  before :each do
    @blm = BranchLightMeasurement.new
    @blm.branch_light_placement = BranchLightPlacement.new
    @blm.number = 34
    @blm.datetime = Time.utc(2014, 06, 06, 06, 06, 06)
    @blm.measurement = 0.00183
    @blm.photons     = 1.70339328
    @blm.batch = Batch.new
  end

  it 'can be valid' do
    expect(@blm).to be_valid
  end

  it 'is not valid on its own' do
    expect(BranchLightMeasurement.new).to_not be_valid
  end

  it 'is not valid without a placement' do
    @blm.branch_light_placement = nil
    expect(@blm).to_not be_valid
  end

  it 'is not valid without a date' do
    @blm.datetime = nil
    expect(@blm).to_not be_valid
  end

end
