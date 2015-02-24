class BranchLightMeasurement < ActiveRecord::Base
  include BatchImport

  validates :datetime, :presence => true
  validates :number, :presence => true
  validates :measurement, :presence => true
  validates :ppfd, :presence => true

end
