class ChangeSpectraMeasurementType < ActiveRecord::Migration
  def change
    rename_column :spectra_measurements, :type, :measurement_type
  end
end
