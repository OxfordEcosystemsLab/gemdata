require 'spec_helper'

describe LightReference do

  before :each do
    @lr = LightReference.new
    @lr.plot = Plot.new
    @lr.number = 1  
    @lr.datetime = DateTime.now
    @lr.measurement = 1.234
    @lr.photons = 5.678
    @lr.batch = Batch.new
  end

  it 'should be able to be valid' do
    expect(@lr).to be_valid
  end

  it 'should not be valid on its own' do
    expect(LightReference.new).to_not be_valid
  end

end
