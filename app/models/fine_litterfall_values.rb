class FineLitterfallValues < ActiveRecord::Base

  include CSVImportTable

  include ValidatePlotAndDate

  validates :litter_trap_num,     presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
  validates :litter_trap_size_m2, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 10 }

  validates :collection_period_days, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 45 }

  validates :leaves_g_per_trap,      allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :twigs_g_per_trap,       allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :flowers_g_per_trap,     allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :fruits_g_per_trap,      allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :bromeliads_g_per_trap,  allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :epiphytes_g_per_trap,   allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :other_g_per_trap,       allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :palm_leaves_g,          allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :palm_flower_g,          allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :palm_fruit_g,           allow_nil: true, numericality: { greater_than_or_equal_to: 0 }

  def self.unique_key_columns
    [:plot_code, :year, :month, :day, :litter_trap_num]
  end

  has_default_values(
    litter_trap_size_m2: 0.25
  )

end
