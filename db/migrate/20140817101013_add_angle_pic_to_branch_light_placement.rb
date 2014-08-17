class AddAnglePicToBranchLightPlacement < ActiveRecord::Migration
  def change
    add_column :branch_light_placements, :angle_pic, :float
  end
end
