require "spec_helper"

describe ToughnessMeasurement do

  before :each do
    @valid = ToughnessMeasurement.new
    @valid.date      = Date.new
    @valid.evaluator = 'Ben'
    @valid.replica   = 'L24'
    @valid.thickness = 12.1
    @valid.width     = 12.2
    @valid.lines     = 42
    @valid.punch     = 2.1
  end

  it 'is not valid on its own' do
    expect(ToughnessMeasurement.new).to_not be_valid
  end

  it 'can read a T code' do
    t = @valid
    t.code = "WAY01-T1031-B1S"
    expect(t).to be_valid
  end

  it 'can read a CSP code' do
    t = @valid
    t.code = "WAY01-CSP28003-B77-S"
    expect(t).to be_valid
  end
end
