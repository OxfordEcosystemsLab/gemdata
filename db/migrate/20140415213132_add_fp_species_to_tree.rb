class AddFpSpeciesToTree < ActiveRecord::Migration
  def change
    add_reference :trees, :fp_species, index: true
  end
end
