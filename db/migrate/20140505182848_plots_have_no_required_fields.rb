class PlotsHaveNoRequiredFields < ActiveRecord::Migration
  def change
    change_column :sub_plots, :plot_id, :integer, :null => true
    change_column :sub_plots, :sub_plot_code, :string, :null => true
    change_column :sub_plots, :sub_plot_type, :string, :null => true
    change_column :sub_plots, :sub_plot_area_m2, :float, :null => true
  end
end

