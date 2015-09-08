class SmallTreeDendrometerReading < ActiveRecord::Base
  include BatchImport

  belongs_to :tree

  validates :tree, :date, :pom_height_m, presence: true

  validates :wood_density_g_m2,  numericality: { greater_than: 0, less_than_or_equal_to: 50 }, allow_nil: true
  validates :tree_height_m,      numericality: { greater_than: 0, less_than_or_equal_to: 20 }, allow_nil: true
  validates :pom_height_m,       numericality: { greater_than: 0, less_than_or_equal_to: 10 }, allow_nil: true
  validates :dbh_nodirection_mm, numericality: { greater_than: 0, less_than_or_equal_to: 250 }, allow_nil: true
  validates :dbh_northsouth_cm,  numericality: { greater_than: 0, less_than_or_equal_to: 250 }, allow_nil: true
  validates :dbh_westeast_cm,    numericality: { greater_than: 0, less_than_or_equal_to: 250 }, allow_nil: true

  # validates :dendrometer_reading_replaced_mm, allow_nil: true, numericality: { greater_than_or_equal_to: -10, less_than_or_equal_to: 100 }

  # validates :status_code_intact_moved_broken, allow_nil: true, inclusion: { in: %w(intact moved broken) }
  # validates :mortality_code_alive_dead,       allow_nil: true, inclusion: { in: %w(alive dead) }

  validates :quality_code, allow_nil: true, inclusion: { in: %w(good not_sure do_not_use),
                                              message: "should be 'good', 'not_sure' or 'do_not_use'." }

end
