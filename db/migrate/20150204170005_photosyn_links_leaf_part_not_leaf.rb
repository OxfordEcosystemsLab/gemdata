class PhotosynLinksLeafPartNotLeaf < ActiveRecord::Migration
  def change
    remove_foreign_key :photosynthesis_measurements, :leaves
    remove_column :photosynthesis_measurements, :leaf_id
    add_reference  :photosynthesis_measurements, :leaf_part, index: true
    add_foreign_key :photosynthesis_measurements, :leaf_parts
  end
end
