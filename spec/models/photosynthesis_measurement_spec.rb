require 'spec_helper'

describe PhotosynthesisMeasurement do

  before :each do
    leaf_part = set_up_leaf_part('SPD01', 'T1159', 'B1S', 'L5', '00')
    
    @pm = PhotosynthesisMeasurement.new
    @pm.leaf_part = leaf_part
    @pm.code = 'SPD01-T1159-B1S-L5'
    @pm.date = Date.new(1966,4,1)
    @pm.time = '23:42:11'
    @pm.photosynthesis = 1.23
    @pm.conductance = 4.56
    @pm.transpiration = 7.89
    @pm.batch_id = 1
    @pm.filename = 'all-the-answers.xls'
    @pm.pm_type = 'ASAT'
    @pm.photosynthesis_std = 9.87
    @pm.conductance_std = 6.54
    @pm.internal_co2 = 1001.1001
    @pm.vpd = 3.21
    @pm.area_corr = 1
    @pm.air_temp = 1.2
    @pm.leaf_temp = 3.4
    @pm.co2_reference = 1002.1002
    @pm.co2_sample = 1003.1003
    @pm.water_reference = 7.8
    @pm.water_sample = 9.1
    @pm.rh_reference = 91.91
    @pm.rh_sample = 82.82
    @pm.par_in = 1004.1004
    @pm.pressure = 7.6
  end

  it 'is not valid on its own' do
    expect(PhotosynthesisMeasurement.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@pm).to be_valid
  end
  
  it 'is valid with type=AMAX' do
    @pm.pm_type = 'AMAX'
    expect(@pm).to be_valid
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
      @pm.pm_type = val
      expect(@pm).to_not be_valid
    end
  end
  
  it 'is invalid without a leaf part' do
    @pm.leaf_part = nil
    expect(@pm).to_not be_valid
  end

  it 'is invalid without a date' do
    @pm.date = nil
    expect(@pm).to_not be_valid
  end
  
  it 'is invalid with a poorly formatted date' do
    @pm.date = 'March 47th 2807'
    expect(@pm).to_not be_valid
  end

  # time can't be validated in the model!
  # if a badly formed time is put in the field it'll end up as nil
  # which would be fine BUT time is sometimes nil anyway
  # this will have to be validated in the importer

  #it 'is invalid with a poorly formatted time' do
  #  @pm.time = "12 O'clock"
  #  expect(@pm).to_not be_valid
  #end
  
  #it 'is valid with no time' do
  #  @pm.time = nil
  #  expect(@pm).to be_valid
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
  @v = -273.15
  while @v < 0  do
    @cols.each do |column|
      it "is invalid with a negative #{column}" do
        @pm[column] = @v
        expect(@pm).to_not be_valid
      end
    end
    @v = @v + 55
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
      @pm[column] = 0
      expect(@pm).to_not be_valid
    end
  end

  @cols = [
    'internal_co2',
    'co2_reference',
    'co2_sample'
  ]  
  @cols.each do |column|
    it "is invalid with #{column} = 2000" do
      @pm[column] = 2000
      expect(@pm).to_not be_valid
    end
  end

  @cols = [
    'internal_co2',
    'co2_reference',
    'co2_sample',
    'par_in'
  ]
  @v = 3000
  while @v > 2000  do
    @cols.each do |column|
      it "is invalid with a #{column} > 2000" do
        @pm[column] = @v
        expect(@pm).to_not be_valid
      end
    end
    @v = @v - 99
  end

  @cols = [
    'rh_reference',
    'rh_sample'
  ]  
  @v = 1000
  while @v > 100  do
    @cols.each do |column|
      it "is invalid with a #{column} > 100" do
        @pm[column] = @v
        expect(@pm).to_not be_valid
      end
    end
    @v = @v - 23
  end

  @v = 10
  while @v > 1  do
    it "is invalid with an area_corr > 1" do
      @pm.area_corr = @v
      expect(@pm).to_not be_valid
    end
    @v = @v - 1
  end

end
