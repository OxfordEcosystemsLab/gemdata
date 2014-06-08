class AddPlotToCensus < ActiveRecord::Migration
  def change
    add_reference :censuses, :plot
    add_foreign_key :censuses, :plots
  end
end
