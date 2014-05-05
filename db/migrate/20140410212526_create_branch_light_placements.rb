class CreateBranchLightPlacements < ActiveRecord::Migration
  def change
    create_table :branch_light_placements do |t|
      t.references :branch, index: true
      t.foreign_key :branches
      t.references :weather_reading, index: true
      t.foreign_key :weather_readings
      t.string :sun_shade
      t.string :pic1
      t.string :pic2
      t.string :pic3
      t.float :hd_pic
      t.float :alt_pic
      t.float :az_pic
      t.float :az_branch
      t.float :vd_branch
      t.float :hd_branch
      t.float :vground_branch
      t.string :light_cond
      t.string :liana_cov
      t.string :note
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
