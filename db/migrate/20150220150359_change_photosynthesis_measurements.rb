class ChangePhotosynthesisMeasurements < ActiveRecord::Migration
  def change
    change_table :photosynthesis_measurements do |t|
      t.string :comment
      t.string :quality_flag
    end
  end
end
