class CreateSpectraMeasurements < ActiveRecord::Migration
  def change
    create_table :spectra_measurements do |t|
      t.references :leaf, :index => true
      t.foreign_key :leaves
      t.string :code
      t.string :comments
      t.string :branch
      t.string :order
      t.string :type
      (350..1100).each do |wavelength|
        t.float "measurement-#{wavelength.to_s}"
      end

      t.timestamps
    end
  end
end
