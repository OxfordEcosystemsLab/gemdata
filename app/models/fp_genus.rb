class FpGenus < ActiveRecord::Base
  belongs_to :fp_family

  validates :fp_family, :fp_id, :name, :presence => true
  validates :name, uniqueness: {:scope => :fp_family}

end
