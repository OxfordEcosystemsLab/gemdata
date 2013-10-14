class FineLitterfallValues < ActiveRecord::Base

  include CSVImportTable

  include ValidatePlotAndDate

  validates :collector_num, presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }

  validates :leaves_g,      allow_nil: true, numericality: { greater_than: 0 }
  validates :twigs_g,       allow_nil: true, numericality: { greater_than: 0 }
  validates :flowers_g,     allow_nil: true, numericality: { greater_than: 0 }
  validates :fruits_g,      allow_nil: true, numericality: { greater_than: 0 }
  validates :bromeliads_g,  allow_nil: true, numericality: { greater_than: 0 }
  validates :epiphytes_g,   allow_nil: true, numericality: { greater_than: 0 }
  validates :other_g,       allow_nil: true, numericality: { greater_than: 0 }
  validates :palm_leaves_g, allow_nil: true, numericality: { greater_than: 0 }
  validates :palm_flower_g, allow_nil: true, numericality: { greater_than: 0 }
  validates :palm_fruit_g,  allow_nil: true, numericality: { greater_than: 0 }

  def self.unique_key_columns
    [:plot_code, :year, :month, :day, :collector_num]
  end

end
