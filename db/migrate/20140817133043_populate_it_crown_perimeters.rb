class PopulateItCrownPerimeters < ActiveRecord::Migration
  def change
    add_column :crown_perimeters, :time, :datetime
    add_column :crown_perimeters, :seq,  :integer
    add_column :crown_perimeters, :sun,  :string
    add_column :crown_perimeters, :type, :string
    add_column :crown_perimeters, :az,   :float
    add_column :crown_perimeters, :vd,   :float
    add_column :crown_perimeters, :hd,   :float
    add_column :crown_perimeters, :note, :string
    add_column :crown_perimeters, :x,    :float
    add_column :crown_perimeters, :y,    :float
    add_column :crown_perimeters, :z,    :float
  end
end
