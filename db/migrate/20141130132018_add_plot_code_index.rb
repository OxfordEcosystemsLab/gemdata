class AddPlotCodeIndex < ActiveRecord::Migration
  def change
    add_index :plots, :plot_code
  end
end
