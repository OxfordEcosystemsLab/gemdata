require 'spec_helper'

describe Tree do

  before :each do
    @tree = Tree.new
    @tree.tree_code = 'abc'
    @tree.sub_plot = SubPlot.create(:plot_id => 2)
    @tree.fp_species = FpSpecies.create(:name => 'Sapien')
  end

  it 'can be valid' do
    expect(@tree).to be_valid
  end

  it 'is not valid without a tree code' do
    @tree.tree_code = nil
    expect(@tree).to_not be_valid
    expect(@tree).to have(1).errors_on(:tree_code)
  end

  it 'is not valid without a sub plot' do
    @tree.sub_plot = nil
    expect(@tree).to_not be_valid
    expect(@tree).to have(1).errors_on(:sub_plot)
  end

  it 'is not valid without a species' do
    @tree.fp_species = nil
    expect(@tree).to_not be_valid
    expect(@tree).to have(1).errors_on(:fp_species)
  end

end
