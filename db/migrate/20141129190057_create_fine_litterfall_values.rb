class CreateFineLitterfallValues < ActiveRecord::Migration
  def change

    drop_table :fine_litterfall_values
    drop_table :litterfall_traps

    create_table :litterfall_traps do |t|
      t.references :plot, null: false, index: true
      t.string     :litterfall_trap_num, null: false
      t.float      :litterfall_trap_size_m2, null: false
      t.integer    :batch_id
      t.timestamps
    end
    add_index :litterfall_traps, [:plot_id, :litterfall_trap_num], unique: true
    add_foreign_key :litterfall_traps, :plots

    create_table :fine_litterfall_values do |t|
      t.references :litterfall_trap, null: false, index: true
      t.datetime   :collection_date, null: false, index: true
      t.float      :leaves_g_per_trap
      t.float      :twigs_g_per_trap
      t.float      :flowers_g_per_trap
      t.float      :fruits_g_per_trap
      t.float      :bromeliads_g_per_trap
      t.float      :epiphytes_g_per_trap
      t.float      :other_g_per_trap
      t.float      :palm_leaves_g
      t.float      :palm_flower_g
      t.float      :palm_fruit_g
      t.string     :quality_code
      t.text       :comments
      t.integer    :batch_id
      t.timestamps
    end
    add_foreign_key :fine_litterfall_values, :litterfall_traps

  end
end
