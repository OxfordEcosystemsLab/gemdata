require "spec_helper"

describe ToughnessMeasurement do

  it 'is not valid on its own' do
    expect(ToughnessMeasurement.new).to_not be_valid
  end

  it 'can read CSV' do
    t = ToughnessMeasurement.new
    t.read_csv 'Wayqecha,26/04/2013,Yolvi,WAY01-CSP28003-78-S,L12,0.65,6.97,15.5,4.9,'
    expect(t).to be_valid
  end
end
