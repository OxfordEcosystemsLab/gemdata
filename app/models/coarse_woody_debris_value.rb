class CoarseWoodyDebrisValue < ActiveRecord::Base
  include BatchImport

  belongs_to :cwd_sub_transect

  validates :cwd_num,       presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :size_class,    allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
  validates :decay_class,   allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :diameter_1_cm, allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 32120 }
  validates :diameter_2_cm, allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 1200 }
  validates :length_cm,     allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 10000 }
  validates :dry_weight_g,  allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 20270 }

  validates :quality_code, allow_nil: true, inclusion: { in: %w(1 2 3) }

end
