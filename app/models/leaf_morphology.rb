class LeafMorphology < ActiveRecord::Base
  belongs_to :leaf

  validates :leaf,       presence: true
  validates :date,       presence: true
  validates :evaluators, presence: true
  validates :fresh_mass, presence: true
  validates :dry_mass,   presence: true

  validates :dry_mass, numericality: { :less_than_or_equal_to => :fresh_mass }

  validates :fresh_mass,    numericality: { :greater_than => 0 }
  validates :dry_mass,      numericality: { :greater_than => 0 }
  validates :thickness,     numericality: { :greater_than => 0 }, :allow_nil => true
  validates :petiole_width, numericality: { :greater_than => 0 }, :allow_nil => true

  validates :thickness,     presence: true, if: :is_L_leaf?
  validates :petiole_width, absence:  true, if: :is_L_leaf?

  validates :thickness,     absence:  true, if: :is_P_or_T_leaf?
  validates :petiole_width, presence: true, if: :is_P_or_T_leaf?

  def is_L_leaf?
    leaf.code.match /L$/ unless leaf.nil?
  end

  def is_P_or_T_leaf?
    leaf.code.match /[PT]$/ unless leaf.nil?
  end

end
