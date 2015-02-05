class CreateCspTranslation < ActiveRecord::Migration

  def change
    create_table :csp_translations do |t|
      t.string :csp_code
      t.string :genus
      t.string :species
      t.string :full_name
      t.string :family
      t.string :taxon_info
      t.date :date_collected
      t.string :habit
      t.boolean :sun
      t.string :tree_code
      # ASSUMPTION:
      # habit = 'tree'        will be B1S
      # habit = 'tree, shade' will be B11H
      # habit = 'liana'       is a "tree" on it's own
      t.string :branch_code
      t.string :site
    end
    add_index :csp_translations, :csp_code
    add_index :csp_translations, :tree_code
  end

end
