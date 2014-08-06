require 'spec_helper'

describe Leaf do
  before :each do
    @leaf = set_up_leaf('def', 'ghi', 'jkl', 1)
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
