class AddUniqueIndexOnTreeCodeToTrees < ActiveRecord::Migration
  def change
    add_index :trees, [:tree_code, :sub_plot_id], :unique => true
  end
end
