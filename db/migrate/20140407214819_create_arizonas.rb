class CreateArizonas < ActiveRecord::Migration
  def change
    create_table :arizonas do |t|
      t.references :leaf, index: true
      t.foreign_key :leaves
      t.datetime :date
      t.string :evaluators
      t.float :fresh_mass
      t.float :dry_mass
      t.float :thickness
      t.float :petiole_width
      t.string :comments

      t.timestamps
    end
  end
end
