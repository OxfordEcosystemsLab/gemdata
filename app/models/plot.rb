class Plot < ActiveRecord::Base
  validates :plot_code, presence: true
end
