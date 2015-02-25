require 'spec_helper'

describe CnpMeasurement do

  before :each do
    @cnp = CnpMeasurement.new
    @cnp.leaf_part = set_up_leaf_part('SPD01', 'T1159', 'B1S', 'L5', '00')
    @cnp.c_percent = 48.9
    @cnp.n_percent = 1.4
    @cnp.cn_ratio  = 35.3
    @cnp.n15_delta = -2.1
    @cnp.c13_delta = -26.8
    @cnp.cn_assays_file = 'CN_2013_PERU_1_RESULTS'
    @cnp.p_corrected_percent = 0.1171
    @cnp.p_corrected_percent_cv = 0.0140
    @cnp.p_assays_file = 'P_2013_Peru_REDO_1'
    @cnp.batch_id = 1
  end

  it 'is not valid on its own' do
    expect(CnpMeasurement.new).to_not be_valid
  end

  it 'can be valid' do
    expect(@cnp).to be_valid
  end

  it 'should check that deltas are negative' do
    @cnp.n15_delta = 5
    expect(@cnp).to_not be_valid
    expect(@cnp).to have(1).errors_on(:n15_delta)
    @cnp.c13_delta = 101
    expect(@cnp).to_not be_valid
    expect(@cnp).to have(1).errors_on(:c13_delta)
  end

  it 'should check that percentages are within 1 and 100' do
    @cnp.c_percent = -1
    expect(@cnp).to_not be_valid
    expect(@cnp).to have(1).errors_on(:c_percent)
    @cnp.c_percent = 101
    expect(@cnp).to_not be_valid
    expect(@cnp).to have(1).errors_on(:c_percent)
    @cnp.n_percent = -1
    expect(@cnp).to_not be_valid
    expect(@cnp).to have(1).errors_on(:n_percent)
    @cnp.n_percent = 101
    expect(@cnp).to_not be_valid
    expect(@cnp).to have(1).errors_on(:n_percent)
    @cnp.cn_ratio = -1
    expect(@cnp).to_not be_valid
    expect(@cnp).to have(1).errors_on(:cn_ratio)
    @cnp.cn_ratio = 101
    expect(@cnp).to_not be_valid
    expect(@cnp).to have(1).errors_on(:cn_ratio)
  end

  it 'should check that variation is not too high' do
    @cnp.p_corrected_percent_cv = 0.16
    expect(@cnp).to_not be_valid
    expect(@cnp).to have(1).errors_on(:p_corrected_percent_cv)
  end

  it 'does not need percentages to be present' do
    @cnp.c_percent = nil
    @cnp.n_percent = nil
    @cnp.cn_ratio  = nil
    expect(@cnp).to be_valid
  end


end
