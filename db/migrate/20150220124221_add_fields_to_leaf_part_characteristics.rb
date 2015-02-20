class AddFieldsToLeafPartCharacteristics < ActiveRecord::Migration
  def change
    change_table :leaf_part_characteristics do |t|
      t.date :date
      t.string :comments
    end
  end
end
