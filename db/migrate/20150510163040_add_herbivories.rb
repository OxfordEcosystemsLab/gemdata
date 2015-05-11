class AddHerbivories < ActiveRecord::Migration
  def change
    rename_table :herbivories, :herbivories_unused
    create_table :herbivories do |t|
      t.references :leaf, index: true
      t.string :original_code
      t.datetime :date
      t.float :estimated_full_la
      t.float :observed_remaining_la
      t.float :consumed_la
      t.float :percent_consumed
      t.string :note
      t.string :quality_flag
      t.integer :batch_id
      t.timestamps
    end
  end
end
