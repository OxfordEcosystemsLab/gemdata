class CreateCnpMeasurements < ActiveRecord::Migration
  def change
    create_table :cnp_measurements do |t|
      t.references :leaf, index: true
      t.foreign_key :leaves
      t.string :row
      t.integer :column
      t.float :c_percent
      t.float :n_percent
      t.float :cn_ratio
      t.float :n15_delta
      t.float :n13_delta
      t.string :cn_assays_file
      t.float :p_corrected_avg
      t.float :p_corrected_var_coef
      t.string :p_assays_file
      t.integer :box_number

      t.timestamps
    end
  end
end
