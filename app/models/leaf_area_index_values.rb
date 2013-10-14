class LeafAreaIndexValues < ActiveRecord::Base

  include CSVImportTable

  include ValidatePlotAndDate

  validates :true_lai,                       allow_nil: true, numericality: { greater_than: 0 }
  validates :average_leaf_inclination_angle, allow_nil: true, numericality: { greater_than: 0 }
  validates :recalculated_lai,               allow_nil: true, numericality: { greater_than: 0 }
  validates :std_dev,                        allow_nil: true, numericality: { greater_than: 0 }

  def self.unique_key_columns
    [:plot_code, :year, :month, :day]
  end

end
