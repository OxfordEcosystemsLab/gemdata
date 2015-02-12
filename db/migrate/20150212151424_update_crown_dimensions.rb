class UpdateCrownDimensions < ActiveRecord::Migration
  def change
    change_table :crown_dimensions do |t|
      t.float :h_tree
      t.float :poly_vol
      t.float :surf_area
      t.timestamps
    end  
  
  end
end
