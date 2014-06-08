class FpFamily < ActiveRecord::Base
  validates :apg_id, :name, :presence => true
end
