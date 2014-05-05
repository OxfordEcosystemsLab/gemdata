class CreateFpGenus < ActiveRecord::Migration
  def change
    create_table :fp_genera do |t|
      t.references :fp_family, index: true
      t.integer :fp_id
      t.string :name

      t.timestamps
    end
  end
end
