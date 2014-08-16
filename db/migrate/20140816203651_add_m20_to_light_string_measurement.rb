class AddM20ToLightStringMeasurement < ActiveRecord::Migration
  def change
    add_column :light_string_measurements, :m20, :float
  end
end
