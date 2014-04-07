class CreateWoodDensities < ActiveRecord::Migration
  def change
    create_table :wood_densities do |t|
      t.references :branch, index: true
      t.datetime :date
      t.string :evaluator
      t.string :branch_number
      t.float :volume

      t.timestamps
    end
  end
end
