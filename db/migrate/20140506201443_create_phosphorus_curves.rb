class CreatePhosphorusCurves < ActiveRecord::Migration
  def change
    create_table :phosphorus_curves do |t|

      [0, 2, 4, 8, 12, 16].each do |number|
        t.float "first_standard_#{number.to_s}"
        t.float "second_standard_#{number.to_s}"
        t.float "absorbance_#{number.to_s}"
        t.float "concentration_#{number.to_s}"
      end

      t.timestamps
    end
  end
end
