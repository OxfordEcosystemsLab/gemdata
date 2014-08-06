class FpFamily < ActiveRecord::Base
  include BatchImport

  validates :apg_id, :name, :presence => true
end
