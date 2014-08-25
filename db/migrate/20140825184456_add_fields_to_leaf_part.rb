class AddFieldsToLeafPart < ActiveRecord::Migration
  def change
    add_column :leaf_parts, :code, :string
  end
end
