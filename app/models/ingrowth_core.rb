class IngrowthCore < ActiveRecord::Base
  include BatchImport

  belongs_to :plot

  validates :ingrowth_core_num, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }

end
