class CreatePhotosynthesisMeasurements < ActiveRecord::Migration
  def change
    create_table :photosynthesis_measurements do |t|
      t.references :leaf, index: true
      t.foreign_key :leaves
      t.integer :file_number
      t.string :code
      t.integer :order
      t.float :photosynthesis
      t.float :photosynthesis_std
      t.float :conductance
      t.float :conductance_std
      t.float :internal_co2
      t.float :transpiration
      t.float :vpd
      t.float :area
      t.float :air_temp
      t.float :leaf_temp
      t.float :block_temp
      t.float :co2_reference
      t.float :co2_sample
      t.float :water_reference
      t.float :water_sample
      t.float :rh_reference
      t.float :rh_sample
      t.float :flow
      t.float :par_in
      t.float :par_out
      t.float :pressure

      t.timestamps
    end
  end
end
