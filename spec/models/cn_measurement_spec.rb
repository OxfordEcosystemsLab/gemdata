require 'spec_helper'

describe CnMeasurement do

  before :each do
    @cn = CnMeasurement.new
    @cn.leaf = Leaf.new(:code => 'L1L')
    @cn.row = 'A'
    @cn.column = 1
    @cn.c_percent = 49.4
    @cn.n_percent = 1.4
    @cn.cn_ratio = 36.3
    @cn.n15_delta = -3.3
    @cn.c13_delta = -27.7
    @cn.cn_curve = CnCurve.new
  end

  it 'can be valid' do
    expect(@cn).to be_valid
  end

  it 'is invalid without a leaf' do
    @cn.leaf = nil
    expect(@cn).to_not be_valid
  end

  it 'is invalid without a curve' do
    @cn.cn_curve = nil
    expect(@cn).to_not be_valid
  end

  it 'expects a negative N15 delta' do
    @cn.n15_delta = 4
    expect(@cn).to_not be_valid
  end

  it 'expects a negative C13 delta' do
    @cn.c13_delta = 4
    expect(@cn).to_not be_valid
  end

end
