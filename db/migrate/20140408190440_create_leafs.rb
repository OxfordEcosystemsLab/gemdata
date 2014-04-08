class CreateLeafs < ActiveRecord::Migration
  def change
    create_table :leafs do |t|
      t.references :branch, index: true
      t.string :code

      t.timestamps
    end
  end
end
