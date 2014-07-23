class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :import_address
      t.datetime :started
      t.datetime :finished
      t.boolean :transaction_passed

      t.timestamps
    end
  end
end
