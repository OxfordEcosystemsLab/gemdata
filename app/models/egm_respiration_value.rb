class EgmRespirationValue < ActiveRecord::Base
  include BatchImport

  belongs_to :egm_respiration_collar
  belongs_to :ingrowth_core

  validates :ingrowth_core_id,       presence: true,     if: :is_ic
  validates :egm_respiration_collar, presence: true, unless: :is_ic

  # TODO: validates :tree_id,          presence: true, if: :is_stem

  validates :measurement_code, presence: true, inclusion: { in: %w(CTRL PART TOT IC STEM) }
  validates :treatment_code,   presence: true, inclusion: { in: %w(con my so) },          if: :is_part
  validates :disturbance_code, presence: true, inclusion: { in: %w(Y N) },                if: :is_ctrl
  validates :litter_code,      presence: true, inclusion: { in: %w(none normal double) }, if: :is_ic_or_part

  validates :replica,         allow_nil: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 } 
  validates :egm_measurement, presence: true,  numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :recno,           presence: true,  numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :co2ref_ppm,      allow_nil: true, numericality: { greater_than_or_equal_to: 200, less_than_or_equal_to: 800 }
  validates :inputd,          presence: true,  numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :time,            presence: true,  numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :inputf,          presence: true,  numericality: { greater_than_or_equal_to: -10, less_than_or_equal_to: 10 }
  validates :atmp_mb,         allow_nil: true, numericality: { greater_than_or_equal_to: 400, less_than_or_equal_to: 2000 }
  validates :probe_type,      presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :quality_code, allow_nil: true, inclusion: { in: %w(1 2 3) }

  private

    def is_part
      measurement_code == 'PART'
    end

    def is_ctrl
      measurement_code == 'CTRL'
    end

    def is_ic
      measurement_code == 'IC'
    end

    def is_stem
      measurement_code == 'STEM'
    end

    def is_ic_or_part
      %w(IC PART).include?(measurement_code)
    end

end
