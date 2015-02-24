class StretchNotesInLightPlacements < ActiveRecord::Migration
  def change
    change_column :branch_light_placements, :note, :text
    change_column :branch_light_placements, :validation_note, :text
    change_column :branch_light_placements, :field_note, :text
    change_column :branch_light_placements, :confidence, :text
  end
end
