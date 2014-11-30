class DropRespirationTables < ActiveRecord::Migration
  def change
    drop_table :leaf_respiration_values
    drop_table :stem_respiration_values
    drop_table :soil_respiration_values
    drop_table :soil_respiration_tubes
  end
end
