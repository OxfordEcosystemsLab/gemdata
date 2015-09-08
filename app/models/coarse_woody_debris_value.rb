class CoarseWoodyDebrisValue < ActiveRecord::Base
  include BatchImport

  belongs_to :cwd_sub_transect

  validates :cwd_sub_transect, :cwd_num, :date, presence: true

  validates :cwd_num,                              numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :size_class,          allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
  validates :decay_class,         allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :diametertop_1_cm,    allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 32120 }
  validates :diametertop_2_cm,    allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 1200 }
  validates :diameterbottom_1_cm, allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 32120 }
  validates :diameterbottom_2_cm, allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 1200 }
  validates :length_cm,           allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 10000 }
  validates :dry_weight_g,        allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 20270 }

  validates :quality_code,        allow_nil: true, inclusion: { in: %w(good not_sure do_not_use),
                                                    message: "should be 'good', 'not_sure' or 'do_not_use'." }

end
