require 'csv'

class CarnegieBulkLeafChemistry < ActiveRecord::Base
  include BatchImport
  
  belongs_to :branch, foreign_key: :branch_1
  belongs_to :branch, foreign_key: :branch_2
  belongs_to :branch, foreign_key: :branch_3  

  validates :branch_1, presence: true
  #validates :branch_2, presence: true
  #validates :branch_3, presence: true

  validates :csp_code, presence: true

  # flagged - indicating a chemical value was removed
  # reason - explaining which value was removed
  validates :date_collected, presence: true
  validates :n, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, :allow_nil => true
  # chl_a - mg g^(-1) dry mass
  # chl_b - mg g^(-1) dry mass
  # carotenoids - mg g^(-1) dry mass
  validates :soluble_c, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, :allow_nil => true
  # delta_13c - per mill dry mass
  validates :water, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, :allow_nil => true
  validates :p, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, :allow_nil => true
  validates :ca, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, :allow_nil => true
  validates :k, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, :allow_nil => true
  validates :mg, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, :allow_nil => true
  # lma - g dry m^(-2) leaf
  validates :c, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, :allow_nil => true
  validates :lignin, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, :allow_nil => true
  validates :cellulose, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, :allow_nil => true
  validates :hemi_cellulose, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, :allow_nil => true
  validates :phenols, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }, :allow_nil => true
  validates :tannins, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }, :allow_nil => true
  
  # b - mg g^(-1) dry mass
  # fe - mg g^(-1) dry mass
  # mn - mg g^(-1) dry mass
  # zn - mg g^(-1) dry mass
end

