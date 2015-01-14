class SubPlot < ActiveRecord::Base
  include BatchImport

  belongs_to :plot

  has_many :trees

  validates :plot, presence: true

end
