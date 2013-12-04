class LeafRespirationImports < ActiveRecord::Base

  include CSVImportTable

  include ValidatePlotAndDate
  include ValidateTreeTag

  validates :correction, allow_nil: true, numericality: { greater_than_or_equal_to: -10, less_than_or_equal_to: 500 }

  validates :a_sun,      allow_nil: true, numericality: { greater_than_or_equal_to: -5, less_than_or_equal_to: 30 }
  validates :a_shade,    allow_nil: true, numericality: { greater_than_or_equal_to: -5, less_than_or_equal_to: 30 }
  validates :resp_sun,   allow_nil: true, numericality: { greater_than_or_equal_to: -5, less_than_or_equal_to: 30 }
  validates :resp_shade, allow_nil: true, numericality: { greater_than_or_equal_to: -5, less_than_or_equal_to: 30 }

  def self.unique_key_columns
    [:plot_code, :year, :month, :day, :tree_tag]
  end

end
