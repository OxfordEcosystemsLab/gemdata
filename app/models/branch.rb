class Branch < ActiveRecord::Base
  belongs_to :traits_tree

  validates :code, presence: true
  validates :traits_tree, presence: true
end
