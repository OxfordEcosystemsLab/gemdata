class ChangeLightHangingMore < ActiveRecord::Migration
  def change
    change_column :light_hangings, :note, :text
  end
end
