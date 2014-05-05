class CreateFpSpecies < ActiveRecord::Migration
  def change
    create_table :fp_species do |t|
      t.references :fp_genus, index: true
      t.foreign_key :fp_genera
      t.integer :fp_id
      t.string :name

      t.timestamps
    end
  end
end
