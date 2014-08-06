class CnpMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :leaf

  validates :leaf, :presence => true

  validates :n_percent, :c_percent, :cn_ratio, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 }, :allow_nil => true
  validates :n15_delta, :n13_delta, :numericality => { :less_than => 0 }
  validates :p_corrected_var_coef,  :numericality => { :less_than => 0.15 }

  validates :row,    :inclusion => { :in => 'A'..'H', :message => 'Row must be a letter between A and H'}
  validates :column, :inclusion => { :in => 1..12, :message => 'Column must be an integer between 1 and 12'}

end
