require 'spec_helper'

describe LeafMorphology do

  before :each do
    @az = LeafMorphology.new
    @az.leaf = Leaf.create(:code => 'L1L', batch: Batch.create!)
    @az.date = Date.new(2014,4,5)
    @az.evaluators = 'Me-Myself-Irene'
    @az.fresh_mass = 2.31
    @az.dry_mass   = 2.21
    @az.thickness  = 5.32
    @az.batch      = Batch.new
  end

  it 'is not valid on its own' do
    expect(LeafMorphology.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@az).to be_valid
  end

  it 'should check that dry mass is less than fresh mass' do
    @az.dry_mass = 10
    expect(@az).to_not be_valid
    expect(@az).to have(1).errors_on(:dry_mass)
  end

  it 'should check that numbers are positive' do
    @az.leaf = Leaf.new(:code => 'Not L or P leaf')
    @az.fresh_mass = -10
    @az.dry_mass = -10
    @az.thickness = -10
    @az.petiole_width = -10

    expect(@az).to_not be_valid
    expect(@az).to have(1).errors_on(:fresh_mass)
    expect(@az).to have(1).errors_on(:dry_mass)
    expect(@az).to have(1).errors_on(:thickness)
    expect(@az).to have(1).errors_on(:petiole_width)
  end

  it 'should not let a P code not have petiole width' do
    @az.leaf = Leaf.create(:code => 'L1P')
    @az.petiole_width = nil
    expect(@az).to_not be_valid
    expect(@az).to have(1).errors_on(:petiole_width)
  end

  it 'should not let a P code have thickness' do
    @az.leaf = Leaf.create(:code => 'L1P')
    @az.thickness = 1
    expect(@az).to_not be_valid
    expect(@az).to have(1).errors_on(:thickness)
  end

  it 'should not let an L code not have thickness' do
    @az.leaf = Leaf.create(:code => 'L1L')
    @az.thickness = nil
    expect(@az).to_not be_valid
    expect(@az).to have(1).errors_on(:thickness)
  end

  it 'should not let an L code have petiole width' do
    @az.leaf = Leaf.create(:code => 'L1L')
    @az.petiole_width = 1
    expect(@az).to_not be_valid
    expect(@az).to have(1).errors_on(:petiole_width)
  end

  it 'should also let an T code have petiole width' do
    @az.leaf = Leaf.create(:code => 'L1P')
    @az.thickness = nil
    @az.petiole_width = 1
    expect(@az).to be_valid
  end

end
