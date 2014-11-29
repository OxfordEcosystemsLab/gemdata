class SubPlot < ActiveRecord::Base
  include BatchImport

  belongs_to :plot

  validates :plot, :sub_plot_code, presence: true

end
