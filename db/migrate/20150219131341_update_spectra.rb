class UpdateSpectra < ActiveRecord::Migration
  def change
    change_table :spectra_measurements do |t|
      t.remove :leaf_id
      t.integer :leaf_part_id
      t.remove :code
      t.string :original_code
      t.remove :branch
      t.integer :branch_number
      t.remove :order
      t.integer :leaf_number
      t.integer :quality_check
    end
    add_foreign_key :spectra_measurements, :leaf_parts
  end
end
