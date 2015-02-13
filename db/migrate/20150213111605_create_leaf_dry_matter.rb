class CreateLeafDryMatter < ActiveRecord::Migration
  def change
    create_table :leaf_dry_matters do |t|
      t.integer :leaf_part_id
      t.index :leaf_part_id 
      t.date :date
      t.string :evaluators
      t.float :fresh_mass
      t.float :dry_mass
      t.float :thickness
      t.float :petiole_width
      t.string :comments
      t.timestamps
      t.integer :batch_id
    end
  end
end
