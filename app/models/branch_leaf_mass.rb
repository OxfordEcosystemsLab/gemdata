require 'csv'

class BranchLeafMass < ActiveRecord::Base
  include BatchImport

  belongs_to :branch
  validates :branch, presence: true
  
  validates :leaf_weight, numericality: { greater_than: 0 }
  validates :quality_flag, inclusion: { in: %w(g c e), message: "%{value} is not a valid quality flag" }
end
