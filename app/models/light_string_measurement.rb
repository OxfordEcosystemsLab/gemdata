class LightStringMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :light_hanging

  validates :datetime, :presence => true
  validates :record_no, :presence => true

end
