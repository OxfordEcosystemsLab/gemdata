class AddPlotIdToLightReferences < ActiveRecord::Migration
  def change
    add_column :light_references, :plot_id, :integer
    add_foreign_key :light_references, :plots
  end
end
