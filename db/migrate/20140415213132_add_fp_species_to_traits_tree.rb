class AddFpSpeciesToTraitsTree < ActiveRecord::Migration
  def change
    add_reference :traits_trees, :fp_species, index: true
  end
end
