class DropCoarseWoodyDebris < ActiveRecord::Migration
  def change
    drop_table :coarse_woody_debris_values
    drop_table :cwd_sub_transects
    drop_table :cwd_transects
  end
end
