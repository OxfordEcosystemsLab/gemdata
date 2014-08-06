require 'spec_helper'

describe DbhMeasurement do

  before :each do
    @dbh = DbhMeasurement.new
    @dbh.tree = Tree.new
    @dbh.census = Census.new
    @dbh.batch = Batch.new
  end

  it 'can be valid' do
    expect(@dbh).to be_valid
  end

  it 'is not valid without a census' do
    @dbh.census = nil
    expect(@dbh).to_not be_valid
  end

  it 'is not valid without a tree' do
    @dbh.tree = nil
    expect(@dbh).to_not be_valid
  end

end

