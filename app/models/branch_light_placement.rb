class BranchLightPlacement < ActiveRecord::Base
  include BatchImport
  include TimeRange

  belongs_to :branch
  belongs_to :weather_reading

  validates :branch, :presence => true

end
