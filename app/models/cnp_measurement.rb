class CnpMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :leaf_part
  validates :leaf_part, :presence => true

  validates :n_percent, :c_percent, :cn_ratio, :p_corrected_percent, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 }, :allow_nil => true
  validates :n15_delta, :c13_delta, :numericality => { :less_than => 0 }
  validates :p_corrected_percent_cv,  :numericality => { :less_than => 0.15 }

end

