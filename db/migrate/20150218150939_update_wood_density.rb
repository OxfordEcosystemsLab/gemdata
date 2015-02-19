class UpdateWoodDensity < ActiveRecord::Migration
  def change
    change_table 'wood_densities' do |t|
      t.remove 'volume'
      t.remove 'branch_number'
      t.string 'original_code'
      t.string 'branch_type'
      t.float 'fresh_volume_cm3'
      t.float 'dry_mass'
      t.float 'density_gcm3'
      t.string 'comment'
    end
    add_index 'wood_densities', ['branch_id', 'branch_type'], unique: true
  end
end
