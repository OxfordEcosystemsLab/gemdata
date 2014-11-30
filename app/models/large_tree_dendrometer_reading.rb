class LargeTreeDendrometerReading < ActiveRecord::Base
  include BatchImport

  belongs_to :tree

  validates :tree, :date, :dendrometer_reading_mm, presence: true

  validates :pom_height_m,           numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 10  }, allow_nil: true
  validates :dendrometer_reading_mm, numericality: { greater_than_or_equal_to: -10, less_than_or_equal_to: 100 }, allow_nil: true

  validates :quality_code, allow_nil: true, inclusion: { in: %w(1 2 3) }

end
