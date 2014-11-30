class EgmRespirationCollar < ActiveRecord::Base
  include BatchImport

  belongs_to :plot
  belongs_to :sub_plot
  belongs_to :tree

  validates :collar_num, allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :plot_corner_code, allow_nil: true, format: { with: /\A[012345],[012345]\z/, message: "should be in format 'N,N' (no quotes) where N is 0 to 5" } 

end
