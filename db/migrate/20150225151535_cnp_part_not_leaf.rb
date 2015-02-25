class CnpPartNotLeaf < ActiveRecord::Migration
  def change
    change_table 'cnp_measurements' do |t|
      t.remove :leaf_id
      t.integer :leaf_part_id
      t.index :leaf_part_id
    end
  end
end
