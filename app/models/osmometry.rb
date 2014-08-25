require 'csv'

class Osmometry < ActiveRecord::Base
  include BatchImport

  belongs_to :branch

  validates :branch,      presence: true
  validates :date,        presence: true
  validates :temperature, presence: true
  validates :humidity,    presence: true
  validates :m1,          presence: true

end
