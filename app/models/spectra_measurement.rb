class SpectraMeasurement < ActiveRecord::Base
  belongs_to :leaf

  validates :leaf, :branch, :order, :measurement_350, :presence => true
  validates :type, format: {
    with: /top_ref|top_trans|bottom_ref|bottom_trans/,
    message: "type must be one of: 'top_ref', 'top_trans', 'bottom_ref' or 'bottom_trans'"
  }

end
