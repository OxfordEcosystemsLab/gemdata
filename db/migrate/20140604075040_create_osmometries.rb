class CreateOsmometries < ActiveRecord::Migration
  def change
    create_table :osmometries do |t|
      t.datetime :date
      t.float :temperature
      t.float :humidity
      t.string :disk_orientation
      t.references :branch, index: true
      t.float :m1
      t.float :m2
      t.float :m3
      t.float :m4
      t.float :m5
      t.float :m6
      t.float :m7
      t.float :m8
      t.float :m9
      t.float :m10
      t.string :observations
    end

    add_foreign_key :osmometries, :branches
  end
end
