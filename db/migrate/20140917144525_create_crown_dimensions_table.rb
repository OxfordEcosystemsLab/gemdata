class CreateCrownDimensionsTable < ActiveRecord::Migration
  def change
    create_table :crown_dimensions do |t|
      t.references :tree, index: true
      t.float      :depth
      t.float      :width_max
      t.float      :vol
      t.integer    :batch_id
    end
  end
end
