class RemoveTreeClassFromTrees < ActiveRecord::Migration
  def change
    remove_column :trees, :tree_class, :string
  end
end
