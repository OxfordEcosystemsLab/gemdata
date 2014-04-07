class CreateTraitsTrees < ActiveRecord::Migration
  def change
    create_table :traits_trees do |t|
      t.string :code, null: false
      t.references :plot, index: true, null: false

      t.timestamps
    end
    add_index :traits_trees, :code, unique: true
  end
end
