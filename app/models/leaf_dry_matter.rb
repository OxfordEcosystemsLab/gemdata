require 'csv'

class LeafDryMatter < ActiveRecord::Base
  include BatchImport
  
  belongs_to :leaf_part
  validates :leaf_part_id, presence: true
  validates :batch_id, presence: true

  validates :date, presence: true
  validates :evaluators, presence: true
  validates :fresh_mass, numericality: { greater_than: 0 }, allow_nil: true
  validates :dry_mass, numericality: { greater_than: 0 }, allow_nil: true
  validate :dry_mass_is_less_than_fresh_mass
  validates :thickness, numericality: { greater_than: 0 }, allow_nil: true
  validates :petiole_width, numericality: { greater_than: 0 }, allow_nil: true

  private
  
    def dry_mass_is_less_than_fresh_mass
      if dry_mass.present? and fresh_mass.present? and dry_mass > fresh_mass then
        errors.add(:dry_mass, "cannot be more than fresh mass") 
      end 
    end

end
