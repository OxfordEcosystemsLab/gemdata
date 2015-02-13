class AddIndexToLightReference < ActiveRecord::Migration
  def change
    add_index :light_references, :datetime
  end
end
