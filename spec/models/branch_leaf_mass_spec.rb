require 'spec_helper'
require 'date'

describe BranchLeafMass do

  before :each do
    branch = set_up_branch('SPD-01', 'T1159', 'B1S')
    @blm = BranchLeafMass.new
    @blm.date = Date.new(2013,6,9)
    @blm.person = 'Marija Gimbutas'
    @blm.branch = branch
    @blm.original_branchcode = 'spd01-t1159-b1s'
    @blm.leaf_weight = 12.34
    @blm.leaf_rachis_weight = 13.45
    @blm.quality_flag = 'g'
    @blm.comments = 'Well, these experimentalists do bungle things sometimes'
    @blm.batch_id = 1
  end

  it 'is not valid on its own' do
    expect(BranchLeafMass.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@blm).to be_valid
  end

end
