class CrownPerimeter < ActiveRecord::Base
  include BatchImport

  belongs_to :tree

  validates :tree, :presence => true
  validates :time, :presence => true

end
