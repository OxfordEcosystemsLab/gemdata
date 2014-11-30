class Plot < ActiveRecord::Base
  include BatchImport

  has_many :traits_trees
  has_many :sub_plots

  has_many :trees, through: :sub_plots

  validates :plot_code, presence: true

end
