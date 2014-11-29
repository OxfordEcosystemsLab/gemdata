class CreateSmallTreeDendrometerReadings < ActiveRecord::Migration
  def change

    drop_table :small_stem_values

    create_table :small_tree_dendrometer_readings do |t|
      t.references :tree, null: false, index: true
      t.datetime   :date, null: false, index: true
      t.float      :wood_density_g_m2
      t.float      :tree_height_m
      t.float      :pom_height_m
      t.float      :dbh_northsouth_cm
      t.float      :dbh_westeast_cm
      t.string     :rainfor_flag1
      t.string     :rainfor_flag2
      t.string     :rainfor_flag3
      t.string     :quality_code
      t.text       :comments
      t.integer    :batch_id
      t.timestamps
    end
    add_foreign_key :small_tree_dendrometer_readings, :trees

  end
end
