class AddFpSpeciesToTree < ActiveRecord::Migration
  def change
    add_reference :trees, :fp_species, index: true
    add_foreign_key :trees, :fp_species
  end
end
