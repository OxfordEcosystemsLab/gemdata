require 'spec_helper'

describe FpSpecies do
  before :each do
    @species = FpSpecies.new
    @species.name = 'sapiens'
    @species.fp_id = 123
    fp_family = FpFamily.create!(apg_id: 15, name: 'Hominidae', batch: Batch.create!)
    @species.fp_genus = FpGenus.create!(fp_id: 20, name: 'Homo', fp_family: fp_family, batch: Batch.create!)
    @species.batch = Batch.new
  end

  it 'can be valid' do
    expect(@species).to be_valid
  end

  it 'is not valid without a forest plots id' do
    @species.fp_id = nil
    expect(@species).to_not be_valid
  end

  it 'is not valid without a name' do
    @species.name = nil
    expect(@species).to_not be_valid
  end

  it 'is not valid without a fp genus' do
    @species.fp_genus = nil
    expect(@species).to_not be_valid
  end

  it 'must be unique for genus-species combination' do
    @species.save!

    @second_species = FpSpecies.new(
      :fp_id    => 234,
      :fp_genus => @species.fp_genus,
      :name     => @species.name
    )

    expect{@second_species.save!}.to raise_error
  end

end

