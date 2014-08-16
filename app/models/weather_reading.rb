class WeatherReading < ActiveRecord::Base
  include BatchImport

  belongs_to :plot

  validates :plot, :presence => true
  validates :datetime, :presence => true

  def self.find_between(this, that)
    self.readings_between(this, that).first
  end

  private

  def self.readings_between(this, that)
    self.where(:datetime => this..that)
  end

end
