class RemoveTreeClassFromTrees < ActiveRecord::Migration
  def change
    remove_column :trees, :gem_tree, :string
  end
end
