class Plot < ActiveRecord::Base
  has_many :traits_trees

  validates :plot_code, presence: true, uniqueness: true

end
