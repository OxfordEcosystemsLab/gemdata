class CrownDimension < ActiveRecord::Base
  include BatchImport

  belongs_to :tree

  validates :tree, :presence => true

end
