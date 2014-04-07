class CreateBranchArchitectures < ActiveRecord::Migration
  def change
    create_table :branch_architectures do |t|
      t.references :branch, index: true
      t.datetime :date
      t.string   :evaluator
      t.integer :section
      t.integer :parent
      t.string :tip
      t.float :diam_inf
      t.float :diam_sup
      t.float :longitude
      t.string :comments

      t.timestamps
    end
  end
end
