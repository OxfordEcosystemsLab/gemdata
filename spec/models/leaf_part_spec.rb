require 'spec_helper'

describe LeafPart do

  before :each do
    @lp = LeafPart.new
    @lp.leaf = Leaf.new
    @lp.original_code = '130822-OK'
    @lp.code = '130822-OK'
    @lp.batch = Batch.new
    @lp.evaluators = 'Marija Gimbutas'
    @lp.fresh_mass = 5.4
    @lp.dry_mass = 3.2
    @lp.thickness = 2.3
    @lp.petiole_width = 8.7
    @lp.dry_mass_corrected = 3.21
  end

  it 'correctly validates fress_mass Vs dry_mass' do
    @lp.dry_mass = 9.3
    expect(@lp).to_not be_valid
  end

  it 'correctly validates fress_mass Vs dry_mass_corrected' do
    @lp.dry_mass_corrected = 9.3
    expect(@lp).to_not be_valid
  end

  it 'is not valid on its own' do
    expect(LeafPart.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@lp).to be_valid
  end

  it 'it should not be valid without a leaf' do
    @lp.leaf = nil
    expect(@lp).to_not be_valid
  end

end
