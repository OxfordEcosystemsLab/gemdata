class AddDuplicateToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :duplicate, :boolean, default: false
  end
end
