class Leaf < ActiveRecord::Base
  belongs_to :branch

  validates :code, :presence => true
  validates :branch, :presence => true
end
