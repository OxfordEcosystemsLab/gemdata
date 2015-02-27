class RepairBranchArchitectureIndex < ActiveRecord::Migration
  def change
    remove_index :branch_architectures, :branch_id
    add_index :branch_architectures, [:branch_id, :section]
  end
end
