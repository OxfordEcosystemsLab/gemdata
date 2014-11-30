class CreateIngrowthCoreValues < ActiveRecord::Migration
  def change

    drop_table :ingrowth_core_values
    drop_table :ingrowth_cores

    create_table :ingrowth_cores do |t|
      t.references :plot, null: false, index: true
      t.string     :ingrowth_core_num, null: false, index: true
      t.integer    :batch_id
      t.timestamps
    end
    add_index :ingrowth_cores, [:plot_id, :ingrowth_core_num], unique: true
    add_foreign_key :ingrowth_cores, :plots

    create_table :ingrowth_core_values do |t|
      t.references :ingrowth_core, null: false, index: true
      t.datetime   :date, null: false, index: true
      t.string     :is_stock_yn, null: false
      t.float      :ingrowth_core_litterfall_g
      t.float      :soil_humidity_pcnt
      t.float      :soil_temperature_c
      t.integer    :time_step, null: false
      t.integer    :time_step_minutes, null: false
      t.float      :ol_under_2mm_g
      t.float      :ml_under_2mm_g
      t.string     :quality_code
      t.text       :comments
      t.integer    :batch_id
      t.timestamps
    end
    add_foreign_key :ingrowth_core_values, :ingrowth_cores

  end
end
