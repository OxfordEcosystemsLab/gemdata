class LightHanging < ActiveRecord::Base
  include BatchImport

  belongs_to :traits_tree
  belongs_to :weather_reading
end
