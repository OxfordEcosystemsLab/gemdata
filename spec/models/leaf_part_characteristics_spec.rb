require 'spec_helper'

describe LeafPartCharacteristics do

  before :each do
    @lc = LeafPartCharacteristics.new 
    @lc.leaf_part = set_up_leaf_part('SPD-01', 'T1159', 'B1S', 'L5', '00')
    @lc.original_code = '130822-OK'
    #@lc.code = '130822-OK'
    @lc.batch = Batch.new
    @lc.evaluators = 'Marija Gimbutas'
    @lc.fresh_mass = 5.4
    @lc.dry_mass = 3.2
    @lc.thickness = 2.3
    @lc.petiole_width = 8.7
    @lc.dry_mass_corrected = 3.21
  end

  it 'correctly validates fress_mass Vs dry_mass' do
    @lc.dry_mass = 9.3
    expect(@lc).to_not be_valid
  end

  it 'correctly validates fress_mass Vs dry_mass_corrected' do
    @lc.dry_mass_corrected = 9.3
    expect(@lc).to_not be_valid
  end

  it 'is not valid on its own' do
    expect(LeafPart.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@lc).to be_valid
  end

  it 'it should not be valid without a leaf part' do
    @lc.leaf_part = nil
    expect(@lc).to_not be_valid
  end

end
