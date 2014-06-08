class FpSpecies < ActiveRecord::Base
  belongs_to :fp_genus

  validates :fp_genus, :fp_id, :name, :presence => true
  validates :name, uniqueness: {:scope => :fp_genus}
end
