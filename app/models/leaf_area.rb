class LeafArea < ActiveRecord::Base
  include BatchImport

  belongs_to :leaf_part

  validates :leaf_part, presence: true
  validates :date, presence: true
  validates :area, presence: true

end
