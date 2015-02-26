class CreatePhotosynthesisCurves < ActiveRecord::Migration
  def change
    create_table :photosynthesis_curves do |t|
      t.integer :leaf_part_id
      t.string :data_type
      t.integer :reading
      t.text :filename
      t.string :code
      t.integer :area_corr
      t.float :photosynthesis
      t.float :photosynthesis_std
      t.float :conductance
      t.float :conductance_std
      t.float :internal_co2
      t.float :transpiration
      t.float :vpd
      t.float :air_temp
      t.float :leaf_temp
      t.float :co2_reference
      t.float :co2_sample
      t.float :water_reference
      t.float :water_sample
      t.float :rh_reference
      t.float :rh_sample
      t.float :par_in
      t.float :pressure
      t.date :date
      t.time :time
      t.string :comment
      t.string :quality_flag
      t.timestamps
      t.integer :batch_id
    end
    add_index :photosynthesis_curves, [:leaf_part_id, :data_type, :reading], name: 'index_photo_curve_on_part_id_and_type', unique: true
    add_index :photosynthesis_curves, [:leaf_part_id]
  end
end
