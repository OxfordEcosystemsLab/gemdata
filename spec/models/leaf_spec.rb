require 'spec_helper'

describe Leaf do
  before :each do
    plot = Plot.new(:plot_code => 'abc')
    tree = TraitsTree.new(:code => 'def', :plot => plot)
    branch = Branch.new(:code => 'ghi', :traits_tree => tree)
    @leaf = Leaf.new(:code => 'jkl', :branch => branch)
  end

  it 'can be valid' do
    expect(@leaf).to be_valid
  end

  it 'must have a branch' do
    @leaf.branch = nil
    expect(@leaf).to_not be_valid
    expect(@leaf).to have(1).errors_on(:branch)
  end

  it 'must have a code' do
    @leaf.code = nil
    expect(@leaf).to_not be_valid
    expect(@leaf).to have(1).errors_on(:code)
  end
end
