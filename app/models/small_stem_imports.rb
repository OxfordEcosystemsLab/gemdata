class SmallStemImports < ActiveRecord::Base
  include BatchImport


  include CSVImportTable

  include ValidatePlotAndDate
  include ValidateTreeTag

  validates :sub_plot,           allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :growth_period_days, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 45 }

  validates :pom_height_m,       allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
  validates :dbh_mm,             allow_nil: true, numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 20 }
  validates :tree_height_m,      allow_nil: true, numericality: { greater_than: 0, less_than_or_equal_to: 150 }
  validates :wood_density_g_m2,  allow_nil: true, numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 50 }

  def self.unique_key_columns
    [:plot_code, :year, :month, :day, :sub_plot, :tree_tag]
  end

end
