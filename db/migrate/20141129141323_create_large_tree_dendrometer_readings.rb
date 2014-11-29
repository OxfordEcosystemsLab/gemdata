class CreateLargeTreeDendrometerReadings < ActiveRecord::Migration
  def change

    drop_table :dendrometer_values

    create_table :large_tree_dendrometer_readings do |t|
      t.references :tree, null: false, index: true
      t.datetime   :date, null: false, index: true
      t.float      :pom_height_m
      t.float      :dendrometer_reading_mm, null: false
      t.float      :dendrometer_reading_replaced_mm
      t.string     :status_code
      t.string     :mortality_code
      t.text       :comments
      t.integer    :batch_id
      t.timestamps
    end
    add_foreign_key :large_tree_dendrometer_readings, :trees

  end
end
