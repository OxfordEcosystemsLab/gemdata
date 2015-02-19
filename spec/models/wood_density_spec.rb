require 'spec_helper'

describe WoodDensity do

  before :each do
    @wood = WoodDensity.new
    @wood.branch = Branch.create(:code => 'B1S', :batch_id => 1)
    @wood.date = Date.new(2014,4,1)
    @wood.evaluator = 'Ben Holmes'
    @wood.original_code = 'Ceasar'
    @wood.branch_type = 'CC1'
    @wood.fresh_volume_cm3 = 123.41
    @wood.dry_mass = 123.41
    @wood.density_gcm3 = 123.41
    @wood.batch = Batch.create!
  end

  it 'is not valid on its own' do
    expect(WoodDensity.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@wood).to be_valid
  end

  it 'is not valid with a dodgy branch_type' do
    @wood.branch_type = 'Bodge'
    expect(@wood).to_not be_valid
    expect(@wood).to have(1).error_on(:branch_type)
  end

  it 'is does not permit negative fresh_volume_cm3' do
    @wood.fresh_volume_cm3 = -50
    expect(@wood).to_not be_valid
    expect(@wood).to have(1).error_on(:fresh_volume_cm3)
  end

  it 'is does not permit negative dry_mass' do
    @wood.dry_mass = -50
    expect(@wood).to_not be_valid
    expect(@wood).to have(1).error_on(:dry_mass)
  end

  it 'is does not permit negative density_gcm3' do
    @wood.density_gcm3 = -50
    expect(@wood).to_not be_valid
    expect(@wood).to have(1).error_on(:density_gcm3)
  end

  it 'does not allow for density_gcm3 without fresh_volume_cm3' do
    @wood.fresh_volume_cm3 = nil
    expect(@wood).to_not be_valid
    expect(@wood).to have(1).error_on(:density_gcm3)
  end

  it 'does not allow for density_gcm3 without dry_mass' do
    @wood.dry_mass = nil
    expect(@wood).to_not be_valid
    expect(@wood).to have(1).error_on(:density_gcm3)
  end

end
