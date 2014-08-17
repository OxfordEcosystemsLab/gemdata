require 'spec_helper'

describe CrownPerimeter do

  before :each do
    @cp = CrownPerimeter.new
    @cp.tree = Tree.new
    @cp.time = Time.utc(2013, 6, 13, 13, 52, 0)
    @cp.seq  = 1
    @cp.sun  = 'S'
    @cp.reading_type = 'top'
    @cp.az   = 109
    @cp.vd   = 11.1
    @cp.hd   = 3
    @cp.note = 'EL INSTRUMENTO FALLA CONSTANTEMENTE'
    @cp.x    = -1.731006537
    @cp.y    = 2.45022782
    @cp.z    = 11.1
    @cp.batch = Batch.new
  end

  it 'should be able to be valid' do
    expect(@cp).to be_valid
  end

  it 'should not be valid on its own' do
    expect(CrownPerimeter.new).to_not be_valid
  end

  it 'should not be valid without a tree' do
    @cp.tree = nil
    expect(@cp).to_not be_valid
  end

  it 'should not be valid without a time' do
    @cp.time = nil
    expect(@cp).to_not be_valid
  end

end
