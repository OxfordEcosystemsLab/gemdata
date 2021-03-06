class IngrowthCoreImports < ActiveRecord::Base

  include CSVImportTable

  include ValidatePlotAndDate

  validates :ingrowth_core_num,          presence: true,  numericality: { only_integer: true }
  validates :time_step,                  presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }

  validates :time_step_minutes,          presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 20 }
  validates :is_stock_yn,                presence: true,  format: { with: /\A[yn]\z/, message: "should be 'y' or 'n'" }

  validates :collection_period_days,     presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 45 }

  validates :ingrowth_core_litterfall_g, allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :soil_humidity_pcnt,         allow_nil: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :soil_temperature_c,         allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ol_under_2mm_g,             allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ml_under_2mm_g,             allow_nil: true, numericality: { greater_than_or_equal_to: 0 }

  def self.unique_key_columns
    [:plot_code, :year, :month, :day, :ingrowth_core_num, :time_step]
  end

  has_default_values(
    time_step_minutes: 10,
    is_stock_yn: 'n'
  )

end
