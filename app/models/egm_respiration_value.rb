class EgmRespirationValue < ActiveRecord::Base
  include BatchImport

  module Type
    SOIL = 'soil'
    STEM = 'stem'
    CWD  = 'cwd'
    IC   = 'ic'
    LEAF = 'leaf'
  end

  module MeasurementCode
    CTRL = 'CTRL'
    PART = 'PART'
    TOT  = 'TOT'
  end

  TREATMENT_CODES = %w(con_nor_lit con_no_lit con_doub_lit my_nor_lit my_no_lit my_doub_lit so_nor_lit so_no_lit so_doub_lit)
  DISTURBANCE_CODES = %w(Y N)
  LITTER_CODES = %w(none normal double)
  QUALITY_CODES = %w(good not_sure do_not_use)

  belongs_to :plot
  belongs_to :sub_plot
  belongs_to :tree
  belongs_to :egm_respiration_collar
  belongs_to :ingrowth_core
  belongs_to :cwd_transect
  belongs_to :cwd_sub_transect
  
  # Soil
  with_options if: :is_soil do |rec|
    rec.validates :measurement_code,       presence: true,
                                           inclusion: { in: [ MeasurementCode::CTRL,
                                                              MeasurementCode::PART,
                                                              MeasurementCode::TOT ] }
    rec.validates :egm_respiration_collar, presence: true
    rec.validates :replica,                presence: true
    rec.validates :disturbance_code,       presence: true, inclusion: { in: DISTURBANCE_CODES }, if: :is_soil_ctrl
    rec.validates :treatment_code,         presence: true, inclusion: { in: TREATMENT_CODES },   if: :is_soil_part
    rec.validates :litter_code,            presence: true, inclusion: { in: LITTER_CODES },      if: :is_soil_part
  end

  # Stem
  with_options if: :is_stem do |rec|
    rec.validates :tree,            presence: true
  end

  # Coarse woody debris
  with_options if: :is_cwd do |rec|
    rec.validates :egm_respiration_collar, presence: true
  end

  # Ingrowth core
  with_options if: :is_ic do |rec|
    rec.validates :ingrowth_core,   presence: true
    rec.validates :litter_code,     presence: true, inclusion: { in: LITTER_CODES }
  end

  # Leaf
  with_options if: :is_leaf do |rec|
    rec.validates :tree,            presence: true
  end
  
  # All but soil
  with_options unless: :is_soil do |rec|
    rec.validates :replica,         presence: true
    rec.validates :egm_measurement, presence: true
    rec.validates :co2ref_ppm,      presence: true
  end

  # All
  validates :plot,             presence: true
  validates :datetime,         presence: true
  
  validates :respiration_value_type, presence: true,
                                     inclusion: { in: [ Type::SOIL, Type::STEM, Type::CWD, Type::IC, Type::LEAF ] }

  validates :replica,          allow_nil: true, numericality: { greater_than_or_equal_to: 1,   less_than_or_equal_to: 10 }
  validates :egm_measurement,  allow_nil: true, numericality: { greater_than_or_equal_to: 1,   less_than_or_equal_to: 1000 }
  validates :recno,            allow_nil: true, numericality: { greater_than_or_equal_to: 1,   less_than_or_equal_to: 1000 }
  validates :co2ref_ppm,       allow_nil: true, numericality: { greater_than_or_equal_to: 200, less_than_or_equal_to: 800 }
  validates :inputd,           allow_nil: true, numericality: { greater_than_or_equal_to: 0,   less_than_or_equal_to: 1000 }
  validates :time,             allow_nil: true, numericality: { greater_than_or_equal_to: 0,   less_than_or_equal_to: 1000 }
  validates :inputf,           allow_nil: true, numericality: { greater_than_or_equal_to: -10, less_than_or_equal_to: 10 }
  validates :atmp_mb,          allow_nil: true, numericality: { greater_than_or_equal_to: 400, less_than_or_equal_to: 2000 }
  validates :probe_type,       allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :quality_code,     allow_nil: true, inclusion: { in: QUALITY_CODES }

  private
  
    def is_soil
      respiration_value_type == Type::SOIL
    end

    def is_stem
      respiration_value_type == Type::STEM
    end

    def is_cwd
      respiration_value_type == Type::CWD
    end

    def is_ic
      respiration_value_type == Type::IC
    end

    def is_leaf
      respiration_value_type == Type::LEAF
    end

    def is_soil_part
      measurement_code == MeasurementCode::PART
    end

    def is_soil_ctrl
      measurement_code == MeasurementCode::CTRL
    end

end
