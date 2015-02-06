class SubPlot < ActiveRecord::Base
  include BatchImport

  belongs_to :plot

  has_many :trees

  validates :plot, presence: true

  before_save :default_values
  
  def default_values
    if self.sub_plot_code == 'I' then
      self.sub_plot_type = 'Dummy sub-plot for trees not in forestplots'
    end
  end

end
