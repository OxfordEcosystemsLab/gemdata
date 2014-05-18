class Tree < ActiveRecord::Base
  belongs_to :plot
  belongs_to :fp_species

  validates :code, presence: true, uniqueness: true
  validates :plot, presence: true
  validates :fp_species, presence: true

end
