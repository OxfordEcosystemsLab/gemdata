class DropDatetimeFromCrownPerimiters < ActiveRecord::Migration
  def change
    remove_column :crown_perimeters, :time
  end
end
