class CreateLeafPartTranslation < ActiveRecord::Migration
  def change
    create_table :leaf_part_translations do |t|
      t.string :original_suffix
      t.string :part
      t.integer :subsection
      t.string :simple_or_compound
      t.timestamps
      t.integer :batch_id
      t.index :original_suffix
    end
  end
end
