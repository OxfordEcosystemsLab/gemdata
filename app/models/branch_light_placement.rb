class BranchLightPlacement < ActiveRecord::Base
  include BatchImport

  belongs_to :branch
  belongs_to :weather
end
