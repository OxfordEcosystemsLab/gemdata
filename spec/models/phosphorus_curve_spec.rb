require 'spec_helper'

describe PhosphorusCurve do

  before :each do
    @p_curve = PhosphorusCurve.new

    [0, 2, 4, 8, 12, 16].each do |n|
      @p_curve.send("first_standard_#{n}=", 1)
      @p_curve.send("second_standard_#{n}=", 1)
      @p_curve.send("absorbance_#{n}=", 1)
      @p_curve.send("concentration_#{n}=", 1)
    end
  end

  it 'validates presence' do
    @p_curve.first_standard_4 = nil
    expect(@p_curve).to_not be_valid
  end

  it 'validates presence' do
    @p_curve.absorbance_12 = 'clifford the dog'
    expect(@p_curve).to_not be_valid
  end

end
