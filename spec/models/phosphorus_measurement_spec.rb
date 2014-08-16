require 'spec_helper'

describe PhosphorusMeasurement do

  before :each do
    @pm = PhosphorusMeasurement.new
    @pm.leaf = Leaf.new(:code => 'L1L')
    @pm.rack = 'tray2'
    @pm.row = 'A'
    @pm.column = 1
    @pm.sample_mass = 3696
    @pm.sample_absorbance = 0.108
    @pm.sample_concentration = 0.1526503949
    @pm.sample_volume = 20
    @pm.p_mass = 3.0530078971
    @pm.p_original = 0.0826030275
    @pm.corrected_std = 0.0817
    @pm.phosphorus_curve = PhosphorusCurve.new
    @pm.batch = Batch.new
  end

  it 'can be valid' do
    expect(@pm).to be_valid
  end

  it 'is invalid without a leaf' do
    @pm.leaf = nil
    expect(@pm).to_not be_valid
  end

  it 'is invalid without a curve' do
    @pm.phosphorus_curve = nil
    expect(@pm).to_not be_valid
  end

end
