class CnMeasurement < ActiveRecord::Base
  belongs_to :cn_curve
  belongs_to :leaf
end
