class AddTensileStringColumnToToughnessTable < ActiveRecord::Migration
  def change
    add_column :toughness_measurements, :tensile_strength, :float
  end
end
