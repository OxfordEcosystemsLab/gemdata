require 'csv'

class LeafVenation < ActiveRecord::Base
  include BatchImport
  
  belongs_to :leaf_part
  validates :leaf_part_id, presence: true

  validates :census_comparable_branch_code, presence: true
  validates :vein_area_analyzed, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }, allow_nil: true
  validates :vein_density, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 30 }, allow_nil: true
  validates :vein_length_mean, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }, allow_nil: true
  validates :vein_length_sd, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }, allow_nil: true
  validates :vein_tortuosity_mean, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }, allow_nil: true
  validates :vein_tortuosity_sd, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }, allow_nil: true
  validates :vein_minimum_spanning_tree_ratio, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }, allow_nil: true
  validates :vein_areole_elongation_ratio_mean, numericality: { greater_than_or_eqal_to: 1, less_than_or_equal_to: 100 }, allow_nil: true
  validates :vein_areole_elongation_ratio_sd, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true
  validates :vein_areole_roughness_mean, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }, allow_nil: true
  validates :vein_areole_roughness_sd, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }, allow_nil: true
  validates :vein_areole_loopiness, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1e+05 }, allow_nil: true
  validates :vein_freely_ending_veinlet_ratio, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }, allow_nil: true
  validates :vein_area_fraction, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }, allow_nil: true
  validates :vein_thickness_mean_weighted, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3 }, allow_nil: true
  validates :vein_thickness_sd_weighted, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3 }, allow_nil: true

end

