class CoarseWoodyDebrisValues < ActiveRecord::Base

  include CSVImportTable

  include ValidatePlotAndDate

  validates :transect_num,     presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :sub_transect_num, allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :cwd_num,          presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  validates :size_class,       presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }

  validates :diameter_1_cm,    allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 32120 }
  validates :diameter_2_cm,    allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 1200 }
  validates :length_cm,        allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 10000 }
  validates :dry_weight_g,     allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 20270 }

  def self.unique_key_columns
    [:plot_code, :year, :month, :day, :transect_num, :sub_transect_num, :cwd_num]
  end

end
