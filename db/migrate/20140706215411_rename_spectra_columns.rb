class RenameSpectraColumns < ActiveRecord::Migration
  def change
    (350..1100).each do |n|
      rename_column :spectra_measurements, "measurement-#{n}", "measurement_#{n}"
    end
  end
end
