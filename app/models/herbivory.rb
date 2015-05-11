require 'csv'

class Herbivory < ActiveRecord::Base
  include BatchImport

  belongs_to :leaf
  validates :leaf, presence: true

  validates :date, presence: true
end
