class AddBatchIdColumnToTrees < ActiveRecord::Migration
  def change
    add_column :trees, :batch_id, :integer
    add_index :trees, :batch_id
  end
end
