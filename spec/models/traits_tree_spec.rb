require 'spec_helper'

describe TraitsTree do
  
  before :each do
    @tree = TraitsTree.new
    @tree.code = 'abc'
    @tree.plot = Plot.create(:plot_code => 'asd')
    @tree.fp_species = FpSpecies.create(:name => 'Sapien')
  end

  it 'can be valid' do
    expect(@tree).to be_valid
  end

  it 'is not valid without a code' do
    @tree.code = nil
    expect(@tree).to_not be_valid
    expect(@tree).to have(1).errors_on(:code)
  end

  it 'is not valid without a plot' do
    @tree.plot = nil
    expect(@tree).to_not be_valid
    expect(@tree).to have(1).errors_on(:plot)
  end

  it 'is not valid without a species' do
    @tree.fp_species = nil
    expect(@tree).to_not be_valid
    expect(@tree).to have(1).errors_on(:fp_species)
  end

end
