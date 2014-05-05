class CreateBranchLightMeasurements < ActiveRecord::Migration
  def change
    create_table :branch_light_measurements do |t|
      t.references :branch_light_placement, index: true
      t.foreign_key :branch_light_placements
      t.integer :number
      t.datetime :datetime
      t.float :measurement
      t.float :photons

      t.timestamps
    end
  end
end
