require "spec_helper"

describe ToughnessMeasurement do

  it 'is not valid on its own' do
    expect(ToughnessMeasurement.new).to_not be_valid
  end

  it 'can read a T code' do
    t = ToughnessMeasurement.new
    t.code = "WAY01-T1031-B1S"
    expect(t).to be_valid
  end

  it 'can read a CSP code' do
    t = ToughnessMeasurement.new
    t.code = "WAY01-CSP28003-B77-S"
    expect(t).to be_valid
  end
end
