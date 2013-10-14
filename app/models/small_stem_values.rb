class SmallStemValues < ActiveRecord::Base

  include CSVImportTable

  include ValidatePlotAndDate
  include ValidateTreeTag

  validates :sub_plot,          allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :wood_density_g_m2, allow_nil: true, numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 50 }
  validates :tree_height_m,     allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 150 }
  validates :dbh_height_m,      allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
  validates :dbh_cm,            allow_nil: true, numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 20 }

  def self.unique_key_columns
    [:plot_code, :year, :month, :day, :sub_plot, :tree_tag]
  end

end
