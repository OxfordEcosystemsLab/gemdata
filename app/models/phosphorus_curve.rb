class PhosphorusCurve < ActiveRecord::Base
  include BatchImport

  [0, 2, 4, 8, 12, 16].each do |n|
    validates "first_standard_#{n}", presence: true
    validates "second_standard_#{n}", presence: true
    validates "absorbance_#{n}", presence: true
    validates "concentration_#{n}", presence: true

    validates "first_standard_#{n}", numericality: true
    validates "second_standard_#{n}", numericality: true
    validates "absorbance_#{n}", numericality: true
    validates "concentration_#{n}", numericality: true
  end

end
