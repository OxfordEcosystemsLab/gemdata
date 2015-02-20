class CreateLeafPartCharacteristics < ActiveRecord::Migration
  def change
    create_table :leaf_part_characteristics do |t|
      t.integer :leaf_part_id
      t.string :evaluators
      t.string :original_code
      t.float :fresh_mass
      t.float :dry_mass
      t.float :thickness
      t.float :petiole_width
      t.float :dry_mass_corrected
      t.string :quality_flag
      t.timestamps
      t.integer :batch_id
      t.index :batch_id
    end
    change_table :leaf_parts do |t|
      t.remove :evaluators
      t.remove :original_code
      t.remove :fresh_mass
      t.remove :dry_mass
      t.remove :thickness
      t.remove :petiole_width
      t.remove :dry_mass_corrected
    end
  end
end
