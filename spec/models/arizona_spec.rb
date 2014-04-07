require 'spec_helper'

describe Arizona do

  before :each do
    @az = Arizona.new
    @az.leaf = Leaf.create(:code => 'L1L')
    @az.date = Date.new(2014,4,5)
    @az.evaluators = 'Me-Myself-Irene'
    @az.fresh_mass = 2.31
    @az.dry_mass   = 2.21
    @az.thickness  = 5.32
  end

  it 'is not valid on its own' do
    expect(Arizona.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@az).to be_valid
  end

  it 'should check that dry mass is less than fresh mass'

  it 'should check that numbers are positive'

  it 'should not let a P code not have petiole width'
  it 'should not let a P code have thickness'

  it 'should not let an L code not have thickness'
  it 'should not let an L code have petiole width'

  it 'should also let an T code have petiole width'

end
