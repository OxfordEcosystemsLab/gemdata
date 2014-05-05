class CreateToughnessMeasurementsTable < ActiveRecord::Migration
  def change
    create_table :toughness_measurements do |t|
      t.references :branch, index: true, null: false
      t.foreign_key :branches
      t.datetime :date, null: false
      t.string :evaluator
      t.string :replica
      t.float :thickness
      t.float :width
      t.integer :lines
      t.float :punch
    end
  end
end
