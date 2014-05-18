class Tree < ActiveRecord::Base
  belongs_to :plot
  belongs_to :fp_species

  validates :plot, presence: true
  validates :tree_code, presence: true, uniqueness: true
  validates :fp_species, presence: true

end
