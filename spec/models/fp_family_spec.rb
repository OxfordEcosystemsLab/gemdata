require 'spec_helper'

describe FpFamily do

  before :each do
    @family = FpFamily.new
    @family.name = 'Hominidae'
    @family.apg_id = 123
    @family.batch = Batch.new
  end

  it 'can be valid' do
    expect(@family).to be_valid
  end

  it 'is not valid without an APG id' do
    @family.apg_id = nil
    expect(@family).to_not be_valid
  end

  it 'is not valid without a name' do
    @family.name = nil
    expect(@family).to_not be_valid
  end
end

