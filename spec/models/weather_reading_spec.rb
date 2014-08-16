require 'spec_helper'

describe WeatherReading do

  before :each do
    @wr = WeatherReading.new
    @wr.plot = Plot.new
    @wr.datetime = Time.new(2014, 06, 06, 06, 06, 06)
    @wr.clouds = 1
    @wr.light = 'A'
    @wr.rain = 'S'
    @wr.note = 'NUBLADON CON NIEBLA, LUZ DIFUSA'
    @wr.second_note = 'Allie added climate cotes based on description'
    @wr.batch = Batch.new
  end

  it 'can be valid' do
    expect(@wr).to be_valid
  end

  it 'is not valid on its own' do
    expect(WeatherReading.new).to_not be_valid
  end

  it 'is not valid without a plot' do
    @wr.plot = nil
    expect(@wr).to_not be_valid
  end

  it 'is not valid without a date' do
    @wr.datetime = nil
    expect(@wr).to_not be_valid
  end

end
