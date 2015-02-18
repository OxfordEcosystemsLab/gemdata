class DropLeafMorphologies < ActiveRecord::Migration
  def change
    drop_table :leaf_morphologies
  end
end
