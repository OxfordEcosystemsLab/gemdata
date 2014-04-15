class AddForestPlotsIdToPlots < ActiveRecord::Migration
  def change
    add_column :plots, :fp_id, :integer
  end
end
