class CreateLightReferences < ActiveRecord::Migration
  def change
    create_table :light_references do |t|
      t.integer :number
      t.datetime :datetime
      t.float :measurement
      t.float :photons

      t.timestamps
    end
  end
end
