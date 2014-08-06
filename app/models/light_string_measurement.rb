class LightStringMeasurement < ActiveRecord::Base
  include BatchImport

  belongs_to :light_string_hanging
end
