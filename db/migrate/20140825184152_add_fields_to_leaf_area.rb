class AddFieldsToLeafArea < ActiveRecord::Migration
  def change
    add_column :leaf_areas, :date, :date
    add_column :leaf_areas, :person, :string
    add_column :leaf_areas, :area, :float
  end
end
