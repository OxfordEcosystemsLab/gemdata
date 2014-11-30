class SmallTreeDendrometerReading < ActiveRecord::Base
  include BatchImport

  belongs_to :tree

  validates :tree, :date, :dbh_northsouth_cm, presence: true

  validates :pom_height_m,      numericality: { greater_than: 0, less_than_or_equal_to: 10 }, allow_nil: true
  validates :tree_height_m,     numericality: { greater_than: 0, less_than_or_equal_to: 20 }, allow_nil: true
  validates :wood_density_g_m2, numericality: { greater_than: 0, less_than_or_equal_to: 50 }, allow_nil: true
  validates :dbh_northsouth_cm, numericality: { greater_than: 0, less_than_or_equal_to: 250 }, allow_nil: true
  validates :dbh_westeast_cm,   numericality: { greater_than: 0, less_than_or_equal_to: 250 }, allow_nil: true

  validates :quality_code, allow_nil: true, inclusion: { in: %w(1 2 3) }

end
