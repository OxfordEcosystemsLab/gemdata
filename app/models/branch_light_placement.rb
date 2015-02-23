class BranchLightPlacement < ActiveRecord::Base
  include BatchImport
  #include TimeRange

  belongs_to :branch

  validates :branch, :presence => true

end
