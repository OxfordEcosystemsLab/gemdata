class TraitsTree < ActiveRecord::Base
  belongs_to :plot

  validates :code, presence: true
  validates :plot, presence: true
end
