class Branch < ActiveRecord::Base
  include BatchImport

  belongs_to :tree

  validates :code, presence: true
  validates :tree, presence: true
end
