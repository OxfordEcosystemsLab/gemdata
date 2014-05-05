class CreateLightHangings < ActiveRecord::Migration
  def change
    create_table :light_hangings do |t|
      t.references :tree, index: true
      t.references :weather_reading, index: true
      t.integer :last_sensor
      t.float :last_sensor_height
      t.float :first_sensor_to_crown_top
      t.float :az
      t.float :vd
      t.float :hd
      t.string :note
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
