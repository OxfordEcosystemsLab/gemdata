class CreateFpFamilies < ActiveRecord::Migration
  def change
    create_table :fp_families do |t|
      t.integer :apg_id
      t.string :name

      t.timestamps
    end
  end
end
