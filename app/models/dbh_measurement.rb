class DbhMeasurement < ActiveRecord::Base
  belongs_to :tree
  belongs_to :census

  validates :tree, :census, :presence => true
end
