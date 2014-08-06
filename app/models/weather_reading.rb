class WeatherReading < ActiveRecord::Base
  include BatchImport

  belongs_to :plot
end
