class LeafRepellency < ActiveRecord::Base
  include BatchImport

  belongs_to :branch

  validates :branch, presence: true
  validates :replica, presence: true

end
