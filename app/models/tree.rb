class Tree < ActiveRecord::Base

  belongs_to :sub_plot
  belongs_to :fp_species

  validates :tree_code, presence: true, uniqueness: true
  validates :sub_plot, presence: true
  validates :fp_species, presence: true

end
