class BranchLightMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :branch_light_placement
end
