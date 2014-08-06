class AddUniqueIndexToPlot < ActiveRecord::Migration
  def change
    remove_index :plots, :plot_code
    add_index :plots, [:plot_code, :fp_id], :unique => true
  end
end
