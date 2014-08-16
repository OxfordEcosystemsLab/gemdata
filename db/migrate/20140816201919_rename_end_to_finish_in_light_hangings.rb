class RenameEndToFinishInLightHangings < ActiveRecord::Migration
  def change
    rename_column :light_hangings, :end, :finish
  end
end
