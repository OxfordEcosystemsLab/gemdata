class WeatherReading < ActiveRecord::Base
  include BatchImport

  belongs_to :plot

  validates :plot, :presence => true
  validates :datetime, :presence => true

  def self.find_between(this, that)
    self.between(this, that).first!
  end

  private

  def self.between(this, that)
    self.where(:datetime => this..that)
  end

end
