class RespirationControlValues < ActiveRecord::Base

  include CSVImportTable

  include ValidatePlotAndDate

  validates :measurement_code, presence: true

  validates :disturbance_code, presence: true, inclusion: { in: %w(1 2) } # 1 = not disturbed, 2 = disturbed

  validates :co2_ref_ppm,      allow_nil: true, numericality: { greater_than_or_equal_to: 200, less_than_or_equal_to: 800 }
  validates :pressure_mb,      allow_nil: true, numericality: { greater_than_or_equal_to: 400, less_than_or_equal_to: 2000 }
  validates :air_temp_c,       allow_nil: true, numericality: { greater_than_or_equal_to: 0,   less_than_or_equal_to: 60 }
  validates :depth_cm,         allow_nil: true, numericality: { greater_than_or_equal_to: 0,   less_than_or_equal_to: 100 }
  validates :vwc_pcnt,         allow_nil: true, numericality: { greater_than_or_equal_to: 0,   less_than_or_equal_to: 100 }
  validates :delta_flux,       allow_nil: true, numericality: { greater_than_or_equal_to: -10, less_than_or_equal_to: 10 }

  def self.unique_key_columns
    [:plot_code, :year, :month, :day, :measurement_code]
  end

end
