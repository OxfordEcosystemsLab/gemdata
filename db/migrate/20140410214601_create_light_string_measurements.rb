class CreateLightStringMeasurements < ActiveRecord::Migration
  def change
    create_table :light_string_measurements do |t|
      t.references :light_hanging, index: true
      t.datetime :datetime
      t.integer :record
      t.float :m0
      t.float :m0_5
      t.float :m1
      t.float :m1_5
      t.float :m2
      t.float :m2_5
      t.float :m3
      t.float :m3_5
      t.float :m4
      t.float :m4_5
      t.float :m5
      t.float :m6
      t.float :m7
      t.float :m8
      t.float :m9
      t.float :m10
      t.float :m11
      t.float :m12
      t.float :m13
      t.float :m14
      t.float :m15
      t.float :m16
      t.float :m17
      t.float :m18
      t.float :m19
      t.float :m21
      t.float :m22
      t.float :m23
      t.float :m24
      t.float :m25
      t.float :m26

      t.timestamps
    end
  end
end
