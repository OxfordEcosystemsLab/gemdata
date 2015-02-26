class SpecificLeafArea < ActiveRecord::Base
  include BatchImport

  belongs_to :leaf
  validates :leaf, :presence => true

  validates :lamina_area, :lamina_drymass, :laminapetiole_area, :laminapetiole_drymass, :sla_lamina, :sla_lamina_petiole, :lma_lamina, :lma_lamina_petiole, :numericality => { :greater_than => 0 }, :allow_nil => true

  validates :quality_flag, inclusion: { in: %w(g c e), message: "%{value} is not a valid quality flag" }

end
