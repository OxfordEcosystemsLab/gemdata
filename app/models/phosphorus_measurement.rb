class PhosphorusMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :leaf
end
