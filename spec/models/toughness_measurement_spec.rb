require "spec_helper"

describe ToughnessMeasurement do

  before :each do
    @tm = ToughnessMeasurement.new
    @tm.branch = Branch.create
    @tm.date = Date.new(2014,4,5)
    @tm.evaluator = 'Bob'
    @tm.replica = 'L34'
    @tm.thickness = 1.2
    @tm.width = 2.4
    @tm.lines = 23.2
    @tm.punch = 45.9
    @tm.batch = Batch.new
  end

  it 'is not valid on its own' do
    expect(ToughnessMeasurement.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@tm).to be_valid
  end

  it 'gets upset with negative numbers' do
    @tm.thickness = -1
    @tm.width = -1
    @tm.lines = -1
    @tm.punch = -1
    expect(@tm).to_not be_valid
    expect(@tm).to have(1).errors_on(:thickness)
    expect(@tm).to have(1).errors_on(:width)
    expect(@tm).to have(1).errors_on(:lines)
    expect(@tm).to have(1).errors_on(:punch)
  end
end
