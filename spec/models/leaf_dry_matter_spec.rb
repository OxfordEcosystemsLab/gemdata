require 'spec_helper'

describe LeafDryMatter do

  before :each do
    leaf_part = set_up_leaf_part('ACJ-01', 'I2014', 'B1S', 'L1', 'S')
    @dm = LeafDryMatter.new
    @dm.leaf_part = leaf_part
    @dm.batch_id = 1
    @dm.date = Date.new(2013,6,9)
    @dm.evaluators = 'Marija Gimbutas'
    @dm.fresh_mass = 5.4
    @dm.dry_mass = 3.2
    @dm.thickness = 2.3
    @dm.petiole_width = 8.7
    @dm.comments = 'Old Europa'
  end

  it 'is not valid on its own' do
    expect(LeafDryMatter.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@dm).to be_valid
  end

  it 'correctly validates fress_mass Vs dry_mass' do
    @dm.dry_mass = 9.3
    expect(@dm).to_not be_valid
  end

end
