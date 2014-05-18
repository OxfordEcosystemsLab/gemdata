class SubPlot < ActiveRecord::Base

  belongs_to :plot

  validates :plot, presence: true

end
