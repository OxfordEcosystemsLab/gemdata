class Plot < ActiveRecord::Base
  has_many :traits_trees

  validates :plot_code, presence: true, uniqueness: true

  #def plot_code=(code)
  #  write_attribute(:plot_code, code.gsub(/-/, ''))
  #end
end
