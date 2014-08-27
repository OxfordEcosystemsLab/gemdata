class LightStringMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :light_hanging

  validates :datetime, :presence => true
  validates :record, :presence => true

end
