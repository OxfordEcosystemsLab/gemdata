class ChangeBranchLightPlacements < ActiveRecord::Migration
  def change
    change_table 'branch_light_placements' do |t|
      t.remove 'weather_reading_id'
      t.remove 'sun_shade'
      t.remove 'pic1'
      t.remove 'pic2'
      t.remove 'pic3'
      t.remove 'hd_pic'
      t.remove 'alt_pic'
      t.remove 'az_pic'
      t.remove 'angle_pic'
      t.integer 'clouds'
	    t.string 'light'
	    t.string 'rain'
	    t.boolean 'checked'
	    t.float 'mean_branch_PPFD'
	    t.float 'mean_ref_PPFD'
	    t.float 'rel_light_proportion'
	    t.integer 'time_advance'
	    t.integer 'time_delay'
	    t.string 'validation_note'
	    t.string 'confidence'
	    t.string 'field_note'
	    t.string 'quality_flag'
    end
    add_index :branch_light_placements, [:start, :finish]
  end
end
