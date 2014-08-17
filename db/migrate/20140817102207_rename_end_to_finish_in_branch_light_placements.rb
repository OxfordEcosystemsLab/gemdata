class RenameEndToFinishInBranchLightPlacements < ActiveRecord::Migration
  def change
    rename_column :branch_light_placements, :end, :finish
  end
end
