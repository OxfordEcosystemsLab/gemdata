class LightHanging < ActiveRecord::Base
  include BatchImport

  belongs_to :tree
  belongs_to :weather_reading

  validates :tree, :presence => true
  validates :start, :presence => true
  validates :finish, :presence => true

  def self.find_by_time time
    self.where("start < ? AND finish > ?", time, time).first
  end
end
