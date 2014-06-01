class Branch < ActiveRecord::Base
  belongs_to :tree

  validates :code, presence: true
  validates :tree, presence: true
end
