require 'spec_helper'

describe BranchLightPlacement do

  before :each do
    @blp = BranchLightPlacement.new
    @blp.branch = Branch.new
    @blp.sun_shade = 'SOL'
    @blp.pic1 = '100-0004'
    @blp.pic2 = '100-0004'
    @blp.pic3 = '100-0004'
    @blp.hd_pic = 1.8
    @blp.alt_pic = 1
    @blp.angle_pic = 10
    @blp.az_pic = 245
    @blp.az_branch = 83
    @blp.vd_branch = 8
    @blp.hd_branch = 6
    @blp.hd_branch = 6
    @blp.hd_branch = 6
    @blp.light_cond = '2AS'
    @blp.liana_cov = 60
    @blp.note = 'UN ARBOL TUMBADO CON RETONOS'
    @blp.start  = Time.new(2013, 6, 13, 13, 52, 0, '+00:00')
    @blp.finish = Time.new(2013, 6, 14,  9,  0, 0, '+00:00')
    @blp.batch = Batch.new
  end

  it 'should be able to be valid' do
    expect(@blp).to be_valid
  end

  it 'should not be valid on its own' do
    expect(LightHanging.new).to_not be_valid
  end

  it 'should not be valid without a branch' do
    @blp.branch = nil
    expect(@blp).to_not be_valid
  end

  it 'should not be valid without a start date' do
    @blp.start = nil
    expect(@blp).to_not be_valid
  end

  it 'should not be valid without an end date' do
    @blp.finish = nil
    expect(@blp).to_not be_valid
  end

  it 'should find placements by a time' do
    @blp.save!
    expect(BranchLightPlacement.find_by_time Time.new(2013, 6, 14, 7, 0, 0, '+00:00')).to eq(@blp)
  end

end
