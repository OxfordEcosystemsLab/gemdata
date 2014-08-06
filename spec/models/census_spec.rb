require 'spec_helper'

describe Census do

  before :each do
    @census = Census.new
    @census.mean_date = '2014.05'
    @census.number = 2
    @census.plot = set_up_plot('ABC4')
    @census.batch_id = 1
  end

  it 'can be valid' do
    expect(@census).to be_valid
  end

  it 'is not valid without a mean_date' do
    @census.mean_date = nil
    expect(@census).to_not be_valid
  end

  it 'is not valid without a number' do
    @census.number = nil
    expect(@census).to_not be_valid
  end

  it 'is not valid without a plot' do
    @census.plot = nil
    expect(@census).to_not be_valid
  end

  it 'should be unique by plot' do
    @census.save!
    @second = Census.new(number: @census.number, mean_date: @census.mean_date, plot: @census.plot)
    expect{@second.save!}.to raise_error
  end

end
