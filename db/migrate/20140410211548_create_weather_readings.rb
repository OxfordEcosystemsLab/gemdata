class CreateWeatherReadings < ActiveRecord::Migration
  def change
    create_table :weather_readings do |t|
      t.references :plot, index: true
      t.datetime :datetime
      t.integer :clouds
      t.string :light
      t.string :rain
      t.string :note
      t.string :second_note

      t.timestamps
    end
  end
end
