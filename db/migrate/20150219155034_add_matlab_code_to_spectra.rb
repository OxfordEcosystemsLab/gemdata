class AddMatlabCodeToSpectra < ActiveRecord::Migration
  def change
    change_table :spectra_measurements do |t|
      t.string :matlab_branch_code
    end
    add_index :spectra_measurements, [:leaf_part_id, :type], unique: true
  end
end
