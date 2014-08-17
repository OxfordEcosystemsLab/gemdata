class RenameTypeInCrownPerimeters < ActiveRecord::Migration
  def change
    rename_column :crown_perimeters, :type, :reading_type
  end
end
