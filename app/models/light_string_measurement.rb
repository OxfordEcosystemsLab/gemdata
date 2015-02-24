class LightStringMeasurement < ActiveRecord::Base
  include BatchImport

  validates :datetime, :presence => true
  validates :record_no, :presence => true

end
