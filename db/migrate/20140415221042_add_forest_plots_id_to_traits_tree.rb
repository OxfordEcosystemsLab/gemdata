class AddForestPlotsIdToTraitsTree < ActiveRecord::Migration
  def change
    add_column :traits_trees, :fp_id, :integer
  end
end
