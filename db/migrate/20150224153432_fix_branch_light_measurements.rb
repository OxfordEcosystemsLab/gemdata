class FixBranchLightMeasurements < ActiveRecord::Migration
  def change
    change_table :branch_light_measurements do |t|
      t.remove :branch_light_placement_id
      t.remove :photons
      t.float :ppfd
    end
    add_index :branch_light_measurements, [:number, :datetime]
  end
end
