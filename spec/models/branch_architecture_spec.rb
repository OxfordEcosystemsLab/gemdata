require 'spec_helper'
require 'date'

describe BranchArchitecture do

  before :each do
    branch = set_up_branch('SPD01', 'T1159', 'B1S')

    @b = BranchArchitecture.new
    @b.date = Date.new(2013,6,9)
    @b.evaluator = '"Milenka, Tatiana"'
    @b.branch = branch
    @b.section = 1
    @b.parent = 0
    @b.tip = 'NO'
    @b.diam_inf = 12.24
    @b.diam_sup = 10.9
    @b.longitude = 118.9
    @b.comments = 'Test comment'
    @b.batch_id = 1
  end

  it 'is not valid on its own' do
    expect(BranchArchitecture.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@b).to be_valid
  end

  it 'it is valid with a node tip' do
    @b.tip = 'N'
    @b.diam_inf = nil
    @b.diam_sup = nil
    @b.longitude = nil
    expect(@b).to be_valid
  end

  it 'it requires values without a node tip' do
    @b.tip = 'C'
    @b.diam_inf = nil
    @b.diam_sup = nil
    @b.longitude = nil
    expect(@b).to_not be_valid
  end

  it 'validates absence of measurements on node tip' do
    @b.tip = 'N'
    expect(@b).to_not be_valid
    expect(@b).to have(1).errors_on(:diam_inf)
    expect(@b).to have(1).errors_on(:diam_sup)
    expect(@b).to have(1).errors_on(:longitude)
  end

end
