class LightReference < ActiveRecord::Base
  include BatchImport
  belongs_to :plot
  validates :plot, presence: true
  validates :number, presence: true
  validates :datetime, presence: true
  validates :measurement, presence: true
  validates :photons, presence: true
end
