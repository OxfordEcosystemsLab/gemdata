class Tree < ActiveRecord::Base
  include BatchImport

  belongs_to :sub_plot
  belongs_to :fp_species
  belongs_to :batch

  has_many :dbh_measurements
  has_many :censuses, :through => :dbh_measurements

  validates :tree_code, presence: true
  validates :sub_plot, presence: true
  validates :fp_species, presence: true

end
