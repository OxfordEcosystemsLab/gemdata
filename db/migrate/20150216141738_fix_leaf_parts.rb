class FixLeafParts < ActiveRecord::Migration
  def change
    change_table :leaf_parts do |t|
      t.string :code
      t.index :code
    end
  end
end
