require 'spec_helper'

describe CarnegieBulkLeafChemistry do

  before :each do
    @cc = CarnegieBulkLeafChemistry.new
    find_batch(1)
    @cc.batch_id = 1
    @cc.branch_1 = 1 # the foreign keys are "manual" because there are 3 of them
    @cc.date_collected = Date.new(2014,4,1)
    @cc.csp_code = 'CSP28092'
    @cc.n = 50
    @cc.soluble_c = 51
    @cc.water = 52
    @cc.p = 53
    @cc.ca = 54
    @cc.k = 55
    @cc.mg = 56
    @cc.c = 57
    @cc.lignin = 58
    @cc.cellulose = 59
    @cc.hemi_cellulose = 60
    @cc.phenols = 49
    @cc.tannins = 48
  end

  it 'is not valid on its own' do
    expect(CarnegieBulkLeafChemistry.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@cc).to be_valid
  end

  @percent_cols = [
    'n',
    'soluble_c',
    'water',
    'p',
    'ca',
    'k',
    'mg',
    'c',
    'lignin',
    'cellulose',
    'hemi_cellulose',
    'phenols',
    'tannins'
  ]
  @percent_cols.each do |column|
    it 'does not permit negative percentages on #{column}' do
      v = -573.15
      while v < 0  do
        @cc[column] = @v
        expect(@cc).to_not be_valid
        v = v + 32
      end
    end
    it 'does not permit percentages > 100 on #{column}' do
      v = 574.32
      while v > 100  do
        @cc[column] = @v
        expect(@cc).to_not be_valid
        v = v - 31
      end
    end
  end

end
