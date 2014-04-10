class LightHanging < ActiveRecord::Base
  belongs_to :traits_tree
  belongs_to :weather_reading
end
