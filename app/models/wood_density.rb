require 'csv'

class WoodDensity < ActiveRecord::Base
  include BatchImport
  belongs_to :branch
  validates :branch, presence: true
  validates :date, presence: true
  validates :evaluator, presence: true
  validates :original_code, presence: true
  validates :branch_type, presence: true, format: {
    with: /[SC]C[123]/, message: 'Should be SC or CC followed by 1, 2 or 3'
  }
  validates :fresh_volume_cm3, presence: true, numericality: {greater_than: 0}
  validates :dry_mass, presence: true, numericality: {greater_than: 0}
  validates :density_gcm3, presence: true, numericality: {greater_than: 0}
  validate :no_density_without_dry_mass_and_fresh_volume

  private
  
    def no_density_without_dry_mass_and_fresh_volume
      if density_gcm3.present? and (not fresh_volume_cm3.present? or not dry_mass.present?) then
        errors.add(:density_gcm3, 'needs dry_mass and fresh_volume present') 
      end 
    end

end
