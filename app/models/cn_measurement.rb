class CnMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :cn_curve
  belongs_to :leaf

  validates :leaf, :cn_curve, :presence => true
  validates :n15_delta, :c13_delta, :numericality => { :less_than => 0 }
end
