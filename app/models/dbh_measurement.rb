class DbhMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :tree
  belongs_to :census

  validates :tree, :census, :presence => true
end
