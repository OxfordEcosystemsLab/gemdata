class SpectraMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :leaf_part

  validates :leaf_part, :original_code, :leaf_number, :branch_number, :measurement_350, :presence => true

  validates :type, format: {
    with: /tl_ref|tl_trans|bl_ref|bl_trans/,
    message: "type must be one of: 'tl_ref', 'tl_trans', 'bl_ref' or 'bl_trans'"
  }

end
