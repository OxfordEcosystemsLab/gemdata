class SubPlot < ActiveRecord::Base
  include BatchImport

  belongs_to :plot

  has_many :trees

  validates :plot, :sub_plot_code, presence: true

end
