class CwdTransect < ActiveRecord::Base
  include BatchImport

  belongs_to :plot

  validates :cwd_transect_num, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 } 

end
