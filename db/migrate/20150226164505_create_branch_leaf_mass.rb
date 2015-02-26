class CreateBranchLeafMass < ActiveRecord::Migration
  def change
    create_table :branch_leaf_masses do |t|
      t.integer :branch_id
      t.string :person
      t.date :date
      t.string :original_branchcode
      t.float :leaf_weight
      t.float :leaf_rachis_weight
      t.string :quality_flag
      t.string :comments
      t.timestamps
      t.integer :batch_id
    end
  end
end
