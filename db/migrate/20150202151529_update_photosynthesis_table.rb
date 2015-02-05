class UpdatePhotosynthesisTable < ActiveRecord::Migration
  def change
    change_column :photosynthesis_measurements, :file_number, :text
    rename_column :photosynthesis_measurements, :file_number, :filename
    rename_column :photosynthesis_measurements, :order, :area_corr
    add_column :photosynthesis_measurements, :pm_type, :string
    add_column :photosynthesis_measurements, :date, :date
    add_column :photosynthesis_measurements, :time, :time
    remove_column :photosynthesis_measurements, :area, :float
    remove_column :photosynthesis_measurements, :block_temp, :float
    remove_column :photosynthesis_measurements, :par_out, :float
    remove_column :photosynthesis_measurements, :flow, :float
  end
end
