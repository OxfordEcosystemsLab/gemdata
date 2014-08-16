class PhosphorusMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :leaf
  belongs_to :phosphorus_curve

  validates :leaf, :phosphorus_curve, :presence => true
end
