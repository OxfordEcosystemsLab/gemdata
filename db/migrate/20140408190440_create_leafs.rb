class CreateLeafs < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.references :branch, index: true
      t.foreign_key :branches
      t.string :code

      t.timestamps
    end
  end
end
