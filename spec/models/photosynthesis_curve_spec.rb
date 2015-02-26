require 'spec_helper'

describe PhotosynthesisCurve do

  before :each do
    leaf_part = set_up_leaf_part('SPD01', 'T1159', 'B1S', 'L5', '00')   
    @pc = PhotosynthesisCurve.new
    @pc.leaf_part = leaf_part
    @pc.data_type = 'CO2'
    @pc.reading = 1
    @pc.code = 'SPD01-T1159-B1S-L5'
    @pc.date = Date.new(1966,4,1)
    @pc.time = '23:42:11'
    @pc.photosynthesis = 1.23
    @pc.conductance = 4.56
    @pc.transpiration = 7.89
    @pc.batch_id = 1
    @pc.filename = 'all-the-answers.xls'
    @pc.photosynthesis_std = 9.87
    @pc.conductance_std = 6.54
    @pc.internal_co2 = 1001.1001
    @pc.vpd = 3.21
    @pc.area_corr = 1
    @pc.air_temp = 1.2
    @pc.leaf_temp = 3.4
    @pc.co2_reference = 1002.1002
    @pc.co2_sample = 1003.1003
    @pc.water_reference = 7.8
    @pc.water_sample = 9.1
    @pc.rh_reference = 91.91
    @pc.rh_sample = 82.82
    @pc.par_in = 1004.1004
    @pc.pressure = 7.6
  end

  it 'is not valid on its own' do
    expect(PhotosynthesisCurve.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@pc).to be_valid
  end
  
  it 'is valid with type=LIGHT' do
    @pc.data_type = 'LIGHT'
    expect(@pc).to be_valid
  end

  @badData = [
    '',
    'MILK',
    'book',
    'internal_co2',
    'grock!',
    '2',
    973
  ]
  @badData.each do |val|
    it "is invalid with a strange type" do
      @pc.data_type = val
      expect(@pc).to_not be_valid
    end
  end
  
  it 'is invalid without a leaf part' do
    @pc.leaf_part = nil
    expect(@pc).to_not be_valid
  end

  it 'is invalid without a date' do
    @pc.date = nil
    expect(@pc).to_not be_valid
  end
  
  it 'is invalid with a poorly formatted date' do
    @pc.date = 'March 47th 2807'
    expect(@pc).to_not be_valid
  end

  # time can't be validated in the model!
  # if a badly formed time is put in the field it'll end up as nil
  # which would be fine BUT time is sometimes nil anyway
  # this will have to be validated in the importer

  #it 'is invalid with a poorly formatted time' do
  #  @pc.time = "12 O'clock"
  #  expect(@pc).to_not be_valid
  #end
  
  #it 'is valid with no time' do
  #  @pc.time = nil
  #  expect(@pc).to be_valid
  #end
  
  @cols = [
    'area_corr',
    'photosynthesis_std',
    'conductance_std',
    'internal_co2',
    'vpd',
    'air_temp',
    'leaf_temp',
    'co2_reference',
    'co2_sample',
    'water_reference',
    'water_sample',
    'rh_reference',
    'rh_sample',
    'par_in',
    'pressure'
  ]
  @cols.each do |column|
    it "is invalid with a negative #{column}" do
      @pc[column] = -1
      expect(@pc).to_not be_valid
    end
  end

  @cols = [
    'photosynthesis_std',
    'conductance_std',
    'internal_co2',
    'vpd',
    'air_temp',
    'leaf_temp',
    'co2_reference',
    'co2_sample',
    'water_reference',
    'water_sample',
    'pressure'
  ]  
  @cols.each do |column|
    it "is invalid with a zero #{column}" do
      @pc[column] = 0
      expect(@pc).to_not be_valid
    end
  end

  @cols = [
    'internal_co2',
    'co2_reference',
    'co2_sample'
  ]  
  @cols.each do |column|
    it "is invalid with #{column} = 2000" do
      @pc[column] = 2000
      expect(@pc).to_not be_valid
    end
  end

  @cols = [
    'internal_co2',
    'co2_reference',
    'co2_sample',
    'par_in'
  ]
  @cols.each do |column|
    it "is invalid with a #{column} > 2000" do
      @pc[column] = 3000
      expect(@pc).to_not be_valid
    end
  end

  @cols = [
    'rh_reference',
    'rh_sample'
  ]  
  @cols.each do |column|
    it "is invalid with a #{column} > 100" do
      @pc[column] = 200
      expect(@pc).to_not be_valid
    end
  end

  it "is invalid with an area_corr > 1" do
    @pc.area_corr = 6
    expect(@pc).to_not be_valid
  end

end
