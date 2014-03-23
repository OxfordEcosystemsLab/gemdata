class CreateToughnessMeasurementsTable < ActiveRecord::Migration
  def change
    create_table :toughness_measurements do |t|
      t.belongs_to :branch, index: true, null: false
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
