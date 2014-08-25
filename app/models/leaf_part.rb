class LeafPart < ActiveRecord::Base
  include BatchImport

  belongs_to :leaf

  validates :leaf, presence: true
  validates :code, presence: true

end
