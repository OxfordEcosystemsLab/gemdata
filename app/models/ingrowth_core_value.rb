class IngrowthCoreValue < ActiveRecord::Base
  include BatchImport

  belongs_to :ingrowth_core

  validates :is_stock_yn,                presence: true,  format: { with: /\A[yn]\z/, message: "should be 'y' or 'n'" }
  validates :ingrowth_core_litterfall_g, allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :soil_humidity_pcnt,         allow_nil: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :soil_temperature_c,         allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :time_step,                  presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }
  validates :time_step_minutes,          presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 20 }
  validates :ol_under_2mm_g,             allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ml_under_2mm_g,             allow_nil: true, numericality: { greater_than_or_equal_to: 0 }

  validates :quality_code, allow_nil: true, inclusion: { in: %w(1 2 3) }

end
