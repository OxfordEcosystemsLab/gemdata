require 'spec_helper'

describe LargeTreeDendrometerReading do

  before :each do
    @rec = LargeTreeDendrometerReading.new
    @rec.tree = Tree.new
    @rec.date = Date.today
    @rec.dendrometer_reading_mm = 10.5
    @rec.batch = Batch.new
  end

  it 'should be able to be valid' do
    expect(@rec).to be_valid
  end

  it 'should not be valid on its own' do
    expect(LargeTreeDendrometerReading.new).to_not be_valid
  end

  it 'should not be valid without a tree' do
    @rec.tree = nil
    expect(@rec).to_not be_valid
  end

end
