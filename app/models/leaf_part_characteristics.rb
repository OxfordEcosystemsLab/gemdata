require 'csv'

class LeafPartCharacteristics < ActiveRecord::Base
  include BatchImport

  belongs_to :leaf_part
  validates :leaf_part, presence: true

  validates :original_code, presence: true
  validates :fresh_mass, numericality: { greater_than: 0 }, allow_nil: true
  validates :dry_mass, numericality: { greater_than_or_equal: 0 }, allow_nil: true
  validates :dry_mass_corrected, numericality: { greater_than: 0 }, allow_nil: true
  validate :dry_mass_is_less_than_fresh_mass
  validate :dry_mass_corrected_is_less_than_fresh_mass
  validates :thickness, numericality: { greater_than: 0 }, allow_nil: true
  validates :petiole_width, numericality: { greater_than: 0 }, allow_nil: true

  private
  
    def dry_mass_is_less_than_fresh_mass
      if dry_mass.present? and fresh_mass.present? and dry_mass > fresh_mass then
        errors.add(:dry_mass, "cannot be more than fresh mass") 
      end 
    end

    def dry_mass_corrected_is_less_than_fresh_mass
      if dry_mass_corrected.present? and fresh_mass.present? and dry_mass_corrected > fresh_mass then
        errors.add(:dry_mass_corrected, "cannot be more than fresh mass") 
      end 
    end

end
