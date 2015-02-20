class SpectraMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :leaf_part

  validates :leaf_part, :original_code, :leaf_number, :branch_number, :matlab_branch_code, :measurement_350, :presence => true

  validates :measurement_type, format: {
    with: /tl_ref|tl_trans|bl_ref|bl_trans/,
    message: "measurement type must be one of: 'tl_ref', 'tl_trans', 'bl_ref' or 'bl_trans'"
  }

end
