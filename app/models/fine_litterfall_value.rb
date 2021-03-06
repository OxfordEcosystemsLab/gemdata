class FineLitterfallValue < ActiveRecord::Base
  include BatchImport

  belongs_to :litterfall_trap

  validates :litterfall_trap, :collection_date, presence: true

  validates :leaves_g_per_trap,     allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :twigs_g_per_trap,      allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :flowers_g_per_trap,    allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :fruits_g_per_trap,     allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :seeds_g_per_trap,      allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :bromeliads_g_per_trap, allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :epiphytes_g_per_trap,  allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :other_g_per_trap,      allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :palm_leaves_g,         allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :palm_flower_g,         allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :palm_fruit_g,          allow_nil: true, numericality: { greater_than_or_equal_to: 0 }

  validates :quality_code,          allow_nil: true, inclusion: { in: %w(good not_sure do_not_use),
                                                      message: "should be 'good', 'not_sure' or 'do_not_use'." }

end
