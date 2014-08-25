class AddFieldsToRepellancy < ActiveRecord::Migration
  def change
    add_column :leaf_repellencies, :replica, :string
    add_column :leaf_repellencies, :photo_number, :integer
    add_column :leaf_repellencies, :angle, :string
  end
end
