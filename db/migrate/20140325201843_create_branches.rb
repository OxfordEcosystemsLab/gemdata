class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :code, null: false
      t.references :traits_tree, index: true, null: false

      t.timestamps
    end
    add_index :branches, :code, unique: true
  end
end