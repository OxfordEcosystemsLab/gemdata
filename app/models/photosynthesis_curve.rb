require 'csv'

class PhotosynthesisCurve < ActiveRecord::Base
  include BatchImport
  
  belongs_to :leaf_part
  validates :leaf_part, presence: true

  validates :code, presence: true
  validates :reading, presence: true

  validates :filename, presence: true
  validates :area_corr, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }, allow_nil: true
  validates :data_type, inclusion: { in: %w(CO2 LIGHT), message: "%{value} is not a valid type" }
  validates :date, presence: true
  # time can't be validated in the model!
  # if a badly formed time is put in the field it'll end up as nil
  # which would be fine for validation BUT time is sometimes nil anyway
  # this will have to be validated in the importer
  validates :photosynthesis, presence: true
  validates :photosynthesis_std, numericality: { equal_to: 0 }
  validates :conductance, presence: true
  validates :conductance_std, numericality: { equal_to: 0 }
  validates :internal_co2, numericality: { greater_than: 0, less_than: 2000 }
  validates :transpiration, presence: true
  validates :vpd, numericality: { greater_than: 0 } # vapor pressure deficit
  validates :air_temp, numericality: { greater_than: 0 }
  validates :leaf_temp, numericality: { greater_than: 0 }
  validates :co2_reference, numericality: { greater_than: 0, less_than: 2000 }
  validates :co2_sample, numericality: { greater_than: 0, less_than: 2000 }
  validates :water_reference, numericality: { greater_than: 0 }
  validates :water_sample, numericality: { greater_than: 0 }
  validates :rh_reference, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 } # relative humidity
  validates :rh_sample, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 } # relative humidity
  validates :par_in, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2000 }
  validates :pressure, numericality: { greater_than: 0 }
end

