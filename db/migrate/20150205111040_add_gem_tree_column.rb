class AddGemTreeColumn < ActiveRecord::Migration
  def change
    add_column :trees, :gem_tree, :boolean, default: true
  end
end
