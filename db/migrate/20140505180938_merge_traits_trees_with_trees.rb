class MergeTraitsTreesWithTrees < ActiveRecord::Migration
  def change
    change_column :trees, :sub_plot_id, :integer, :null => true
    change_column :trees, :tree_code, :string, :null => true
    change_column :trees, :tree_class, :string, :null => true
  end
end
