class AddIndexToPhotosynthesisMeasurements < ActiveRecord::Migration
  def change
    add_index :photosynthesis_measurements, [:leaf_part_id, :pm_type], unique: true
  end
end
