require 'spec_helper'

describe CrownDimension do

  before :each do
    @cd = CrownDimension.new
    @cd.tree = Tree.new
    @cd.depth = 3.9
    @cd.width_max  = 8.8047765175
    @cd.vol  = 282.2939954284
    @cd.batch = Batch.new
  end

  it 'should be able to be valid' do
    expect(@cd).to be_valid
  end

  it 'should not be valid on its own' do
    expect(CrownPerimeter.new).to_not be_valid
  end

  it 'should not be valid without a tree' do
    @cd.tree = nil
    expect(@cd).to_not be_valid
  end

end
