require 'spec_helper'

describe Branch do

  before :each do
    @branch = Branch.new
    @branch.code = '123'
    @branch.traits_tree = TraitsTree.create(:code => 'asdf', :plot => Plot.create(:plot_code => 'abc'))
  end

  it 'can be valid' do
    expect(@branch).to be_valid
  end

  it 'is not valid without a code' do
    @branch.code = nil
    expect(@branch).to_not be_valid
    expect(@branch).to have(1).errors_on(:code)
  end

  it 'is not valid without a tree' do
    @branch.traits_tree = nil
    expect(@branch).to_not be_valid
    expect(@branch).to have(1).errors_on(:traits_tree)
  end

end
