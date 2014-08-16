class LightHanging < ActiveRecord::Base
  include BatchImport

  belongs_to :tree
  belongs_to :weather_reading

  validates :tree, :presence => true
  validates :start, :presence => true
  validates :finish, :presence => true

end
