require 'spec_helper'
require 'date'

describe Osmometry do

  before :each do

    @o = Osmometry.new
    @o.date = Date.new(2013,6,9)
    @o.branch = Branch.new
    @o.temperature = 23.6
    @o.humidity = 56.6
    @o.disk_orientation = 'top'
    @o.m1 = 876
    @o.m2 = 892
    @o.m3 = 926
    @o.m4 = 902
    @o.m5 = 90.2
    @o.m6 = 876
    @o.m7 = 876
    @o.m8 = 876
    @o.m9 = nil
    @o.m10 = 876
    @o.observations = 'It never works'
    @o.batch = Batch.new
  end

  it 'is not valid on its own' do
    expect(Osmometry.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@o).to be_valid
  end

  it 'is not valid without T' do
    @o.temperature = nil
    expect(@o).to_not be_valid
  end

  it 'is not valid without H' do
    @o.humidity = nil
    expect(@o).to_not be_valid
  end

  it 'is not valid without date' do
    @o.date = nil
    expect(@o).to_not be_valid
  end

  it 'is not valid without m1' do
    @o.m1 = nil
    expect(@o).to_not be_valid
  end

end
