class WeatherReading < ActiveRecord::Base
  include BatchImport

  belongs_to :plot

  validates :plot, :presence => true
  validates :datetime, :presence => true

end
