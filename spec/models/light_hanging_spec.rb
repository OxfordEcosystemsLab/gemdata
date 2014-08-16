require 'spec_helper'

describe LightHanging do

  before :each do
    @lh = LightHanging.new
    @lh.tree = Tree.new
    @lh.weather_reading = WeatherReading.new
    @lh.last_sensor = 13
    @lh.last_sensor_height = 0.25
    @lh.first_sensor_to_crown_top = 1.2
    @lh.az = 217
    @lh.vd = 12
    @lh.hd = 1.2
    @lh.note = 'EL INSTRUMENTO FALLA CONSTANTEMENTE'
    @lh.start  = Time.new(2013, 6, 13, 13, 52, 0, '+00:00')
    @lh.finish = Time.new(2013, 6, 14,  9,  0, 0, '+00:00')
    @lh.batch = Batch.new
  end

  it 'should be able to be valid' do
    expect(@lh).to be_valid
  end

  it 'should not be valid on its own' do
    expect(LightHanging.new).to_not be_valid
  end

  it 'should not be valid without a tree' do
    @lh.tree = nil
    expect(@lh).to_not be_valid
  end

  it 'should not be valid without a start date' do
    @lh.start = nil
    expect(@lh).to_not be_valid
  end

  it 'should not be valid without an end date' do
    @lh.finish = nil
    expect(@lh).to_not be_valid
  end

  it 'should find hangings by a time' do
    @lh.save!
    expect(LightHanging.find_by_time Time.new(2013, 6, 14, 7, 0, 0, '+00:00')).to eq(@lh)
  end

end
