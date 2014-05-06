class CreatePhosphorusMeasurements < ActiveRecord::Migration
  def change
    create_table :phosphorus_measurements do |t|
      t.references :leaf, index: true
      t.foreign_key :leaves
      t.references :phosphorus_curve
      t.foreign_key :phosphorus_curves
      t.string :rack
      t.integer :row
      t.string :column
      t.integer :sample_mass
      t.float :sample_absorbance
      t.float :sample_concentration
      t.float :sample_volume
      t.float :p_mass
      t.float :p_original
      t.float :corrected_std

      t.timestamps
    end
  end
end
