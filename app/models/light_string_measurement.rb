class LightStringMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :light_hanging

  validates :datetime, :presence => true
  validates :light_hanging, :presence => true

end
