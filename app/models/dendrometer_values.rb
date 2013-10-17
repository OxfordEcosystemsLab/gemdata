class DendrometerValues < ActiveRecord::Base

  include CSVImportTable

  include ValidatePlotAndDate
  include ValidateTreeTag

  validates :sub_plot,      allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :dbh_height_m,  allow_nil: true, numericality: { greater_than_or_equal_to: 0.2,  less_than_or_equal_to: 10 }
  validates :dbh_mm,        allow_nil: true, numericality: { greater_than_or_equal_to: 1,    less_than_or_equal_to: 500 }
  validates :dbh_growth_mm, allow_nil: true, numericality: { greater_than_or_equal_to: 5,    less_than_or_equal_to: 1500 }
  validates :dbh_year,      allow_nil: true, numericality: { greater_than_or_equal_to: 1983, less_than_or_equal_to: 2099 }

  def self.unique_key_columns
    [:plot_code, :year, :month, :day, :sub_plot, :tree_tag]
  end

end
