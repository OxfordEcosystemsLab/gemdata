class CnCurve < ActiveRecord::Base
  include BatchImport

  [1, 2, 3, 4, 5].each do |n|
    validates "c_enr_#{n}", presence: true
    validates "n_enr_#{n}", presence: true
    validates "c_percent_#{n}", presence: true
    validates "n_percent_#{n}", presence: true
    validates "cn_ratio_#{n}", presence: true

    validates "c_enr_#{n}", numericality: true
    validates "n_enr_#{n}", numericality: true
    validates "c_percent_#{n}", numericality: true
    validates "n_percent_#{n}", numericality: true
    validates "cn_ratio_#{n}", numericality: true
  end

  [6, 7, 8].each do |n|
    validates "c_enr_#{n}", presence: true
    validates "n_enr_#{n}", presence: true

    validates "c_enr_#{n}", numericality: true
    validates "n_enr_#{n}", numericality: true
  end

end
