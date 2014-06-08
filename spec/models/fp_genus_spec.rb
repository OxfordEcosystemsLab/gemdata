require 'spec_helper'

describe FpGenus do

  before :each do
    @genus = FpGenus.new
    @genus.name = 'Homo'
    @genus.fp_id = 123
    @genus.fp_family = FpFamily.create!(apg_id: 15, name: 'Hominidae')
  end

  it 'can be valid' do
    expect(@genus).to be_valid
  end

  it 'is not valid without a forest plots id' do
    @genus.fp_id = nil
    expect(@genus).to_not be_valid
  end

  it 'is not valid without a name' do
    @genus.name = nil
    expect(@genus).to_not be_valid
  end

  it 'is not valid without a fp family' do
    @genus.fp_family = nil
    expect(@genus).to_not be_valid
  end

  it 'must be unique for family-genus combination' do
    @genus.save!

    @second_genus = FpGenus.new(
      :fp_id     => 234,
      :fp_family => @genus.fp_family,
      :name      => @genus.name
    )

    expect{@second_genus.save!}.to raise_error
  end

end

