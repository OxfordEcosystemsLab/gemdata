class UpdateLeafParts < ActiveRecord::Migration
  def change
    change_table :leaf_parts do |t|
      t.string :evaluators
      t.string :original_code
      t.float :fresh_mass
      t.float :dry_mass
      t.float :thickness
      t.float :petiole_width
      t.float :dry_mass_corrected
      t.remove :code
    end
    drop_table :leaf_dry_matters
  end
end
