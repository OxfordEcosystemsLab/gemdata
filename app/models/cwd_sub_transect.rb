class CwdSubTransect < ActiveRecord::Base
  include BatchImport

  belongs_to :cwd_transect

  validates :sub_transect_num,         presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :sub_transect_area_m2,     presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validates :sub_transect_start_point, allow_nil: true, format: { with: /\A[012345],[012345]\z/, message: "should be in format 'N,N' (no quotes) where N is 0 to 5" }
  validates :sub_transect_end_point,   allow_nil: true, format: { with: /\A[012345],[012345]\z/, message: "should be in format 'N,N' (no quotes) where N is 0 to 5" }

end
