class CreateDbhMeasurements < ActiveRecord::Migration
  def change
    create_table :dbh_measurements do |t|
      t.references :tree, index: true
      t.references :census, index: true
      t.float :value

      t.timestamps
    end

    add_foreign_key :dbh_measurements, :trees
    add_foreign_key :dbh_measurements, :censuses
  end
end
