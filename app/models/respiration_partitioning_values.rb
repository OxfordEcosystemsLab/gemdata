class RespirationPartitioningValues < ActiveRecord::Base

  include CSVImportTable

  include ValidatePlotAndDate

  validates :measurement_code, presence: true

  validates :plot_corner_code, allow_nil: true, format: { with: /\A[012345],[012345]\z/, message: "should be in format 'N,N' (no quotes) where N is 0 to 5" }
 
  validates :co2_ref_ppm,      allow_nil: true, numericality: { greater_than_or_equal_to: 200, less_than_or_equal_to: 800 }
  validates :pressure_mb,      allow_nil: true, numericality: { greater_than_or_equal_to: 400, less_than_or_equal_to: 2000 }
  validates :air_temp_c,       allow_nil: true, numericality: { greater_than_or_equal_to: 0,   less_than_or_equal_to: 60 }
  validates :soil_temp_c,      allow_nil: true, numericality: { greater_than_or_equal_to: 0,   less_than_or_equal_to: 60 }
  validates :depth_cm,         allow_nil: true, numericality: { greater_than_or_equal_to: 0,   less_than_or_equal_to: 100 }
  validates :vwc_pcnt,         allow_nil: true, numericality: { greater_than_or_equal_to: 0,   less_than_or_equal_to: 100 }
  validates :delta_flux,       allow_nil: true, numericality: { greater_than_or_equal_to: -10, less_than_or_equal_to: 10 }

  def self.unique_key_columns
    [:plot_code, :year, :month, :day, :measurement_code]
  end

end
