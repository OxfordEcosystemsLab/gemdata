class LitterfallTrap < ActiveRecord::Base
  include BatchImport

  belongs_to :plot

  validates :litterfall_trap_num,     presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
  validates :litterfall_trap_size_m2, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 10 }

end
