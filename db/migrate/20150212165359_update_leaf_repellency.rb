class UpdateLeafRepellency < ActiveRecord::Migration
  def change
    change_table :leaf_repellencies do |t|
      t.string :angle_exclude
      t.string :angle_comments
      t.remove :angle
      t.float :angle
    end  
  end
end
