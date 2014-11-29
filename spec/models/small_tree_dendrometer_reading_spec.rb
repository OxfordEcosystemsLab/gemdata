require 'spec_helper'

describe SmallTreeDendrometerReading do

  before :each do
    @rec = SmallTreeDendrometerReading.new
    @rec.tree = Tree.new
    @rec.date = Date.today
    @rec.dbh_northsouth_cm = 10
    @rec.batch = Batch.new
  end

  it 'should be able to be valid' do
    expect(@rec).to be_valid
  end

  it 'should not be valid on its own' do
    expect(SmallTreeDendrometerReading.new).to_not be_valid
  end

  it 'should not be valid without a tree' do
    @rec.tree = nil
    expect(@rec).to_not be_valid
  end

end
