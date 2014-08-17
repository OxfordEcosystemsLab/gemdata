class LightHanging < ActiveRecord::Base
  include BatchImport
  include TimeRange

  belongs_to :tree
  belongs_to :weather_reading

  validates :tree, :presence => true

end
