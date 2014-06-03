class ChangeTypeOfToughnessMeasurementLines < ActiveRecord::Migration
  def change
    change_column :toughness_measurements, :lines, :float
  end
end
