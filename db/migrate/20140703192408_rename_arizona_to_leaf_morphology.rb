class RenameArizonaToLeafMorphology < ActiveRecord::Migration
  def change
    remove_foreign_key :arizonas, :leaves
    rename_table :arizonas, :leaf_morphologies
    add_foreign_key :leaf_morphologies, :leaves
  end
end
