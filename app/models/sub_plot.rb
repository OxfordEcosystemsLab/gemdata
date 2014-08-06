class SubPlot < ActiveRecord::Base
  include BatchImport

  belongs_to :plot

  validates :plot, presence: true

end
