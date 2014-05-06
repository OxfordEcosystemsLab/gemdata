class CreateCnMeasurements < ActiveRecord::Migration
  def change
    create_table :cn_measurements do |t|
      t.references :cn_curve, index: true
      t.foreign_key :cn_curves
      t.references :leaf, index: true
      t.foreign_key :leaves
      t.integer :sample
      t.string :row
      t.integer :column
      t.float :c_percent
      t.float :n_percent
      t.float :cn_ratio
      t.float :n15_delta
      t.float :c13_delta

      t.timestamps
    end
  end
end
