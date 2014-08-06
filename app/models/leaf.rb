class Leaf < ActiveRecord::Base
  include BatchImport

  belongs_to :branch

  validates :code, :presence => true
  validates :branch, :presence => true
end
