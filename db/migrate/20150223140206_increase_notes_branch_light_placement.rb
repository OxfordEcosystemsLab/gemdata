class IncreaseNotesBranchLightPlacement < ActiveRecord::Migration
  def change
    change_column :branch_light_placements, :validation_note, :text
  end
end
