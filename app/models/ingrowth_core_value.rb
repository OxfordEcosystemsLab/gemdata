class IngrowthCoreValue < ActiveRecord::Base
  include BatchImport

  belongs_to :ingrowth_core

  validates :ingrowth_core, :date, :is_stock_yn, :time_step, :time_step_minutes, presence: true

  validates :is_stock_yn,                format: { with: /\A[yn]\z/, message: "should be 'y' or 'n'" }
  
  validates :ingrowth_core_litterfall_g, allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :soil_humidity_pcnt,         allow_nil: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :soil_temperature_c,         allow_nil: true, numericality: { greater_than_or_equal_to: 0 }

  validates :time_step,                                   numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }
  validates :time_step_minutes,                           numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 20 }

  validates :ol_layer_depth_cm,          allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ml_layer_depth_cm,          allow_nil: true, numericality: { greater_than_or_equal_to: 0 }

  validates :ol_under_2mm_g,             allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ml_under_2mm_g,             allow_nil: true, numericality: { greater_than_or_equal_to: 0 }

  validates :ol_2to3_mm_g,               allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ml_2to3_mm_g,               allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ol_3to4_mm_g,               allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ml_3to4_mm_g,               allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ol_4to5_mm_g,               allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ml_4to5_mm_g,               allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ol_above_5mm_g,             allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ml_above_5mm_g,             allow_nil: true, numericality: { greater_than_or_equal_to: 0 }

  validates :quality_code,               allow_nil: true, inclusion: { in: %w(good not_sure do_not_use),
                                                            message: "should be 'good', 'not_sure' or 'do_not_use'." }

end
