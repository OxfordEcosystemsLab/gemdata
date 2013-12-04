class CoarseWoodyDebrisImports < ActiveRecord::Base

  include CSVImportTable

  include ValidatePlotAndDate

  validates :transect_num,         presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :sub_transect_num,     presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :sub_transect_area_m2, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }

  validates :sub_transect_start_point, allow_nil: true, format: { with: /\A[012345],[012345]\z/, message: "should be in format 'N,N' (no quotes) where N is 0 to 5" }
  validates :sub_transect_end_point,   allow_nil: true, format: { with: /\A[012345],[012345]\z/, message: "should be in format 'N,N' (no quotes) where N is 0 to 5" }

  validates :cwd_num,              presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  validates :collection_period_days, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 45 }

  validates :size_class,           allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
  validates :decay_class,          allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  validates :diameter_1_cm,        allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 32120 }
  validates :diameter_2_cm,        allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 1200 }
  validates :length_cm,            allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 10000 }
  validates :dry_weight_g,         allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 20270 }

  def self.unique_key_columns
    [:plot_code, :year, :month, :day, :transect_num, :sub_transect_num, :cwd_num]
  end

  has_default_values(
    sub_transect_area_m2: 20.0
  )

end
