class BranchLightMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :branch_light_placement

  validates :datetime, :presence => true
  validates :measurement, :presence => true
  validates :branch_light_placement, :presence => true
end
