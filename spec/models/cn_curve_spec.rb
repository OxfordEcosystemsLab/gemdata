require 'spec_helper'

describe CnCurve do

  before :each do
    @cn_curve = CnCurve.new

    [1, 2, 3, 4, 5, 6, 7, 8].each do |n|
      @cn_curve.send("c_enr_#{n}=", 1)
      @cn_curve.send("n_enr_#{n}=", 1)
      @cn_curve.send("c_percent_#{n}=", 1)
      @cn_curve.send("n_percent_#{n}=", 1)
      @cn_curve.send("cn_ratio_#{n}=", 1)
    end
  end

  it 'validates presence' do
    @cn_curve.c_percent_4 = nil
    expect(@cn_curve).to_not be_valid
  end

  it 'validates presence' do
    @cn_curve.cn_ratio_8 = 'clifford the dog'
    expect(@cn_curve).to_not be_valid
  end

end
