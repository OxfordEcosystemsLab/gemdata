class CreateCoarseWoodyDebris < ActiveRecord::Migration
  def change

    create_table :cwd_transects do |t|
      t.references :plot, null: false, index: true
      t.string     :transect_num, null: false, index: true
      t.integer    :batch_id
      t.timestamps
    end
    add_index :cwd_transects, [:plot_id, :transect_num], unique: true
    add_foreign_key :cwd_transects, :plots

    create_table :cwd_sub_transects do |t|
      t.references :cwd_transect, null: false, index: true
      t.string     :sub_transect_num, null: false, index: true
      t.float      :sub_transect_area_m2, null: false
      t.string     :sub_transect_start_point
      t.string     :sub_transect_end_point
      t.integer    :batch_id
      t.timestamps
    end
    add_index :cwd_sub_transects, [:cwd_transect_id, :sub_transect_num], unique: true, name: "index_cwd_sub_transects_on_transect_and_sub_transect"
    add_foreign_key :cwd_sub_transects, :cwd_transects

    create_table :coarse_woody_debris_values do |t|
      t.references :cwd_sub_transect, null: false, index: true
      t.datetime   :date, null: false, index: true
      t.string     :cwd_num, null: false
      t.string     :size_class
      t.string     :decay_class
      t.float      :diameter_1_cm
      t.float      :diameter_2_cm
      t.float      :length_cm
      t.float      :dry_weight_g
      t.string     :quality_code
      t.text       :comments
      t.integer    :batch_id
      t.timestamps
    end
    add_index :coarse_woody_debris_values, [:cwd_sub_transect_id, :date, :cwd_num], unique: true, name: "index_cwd_values_on_sub_transect_date_and_cwd_num"
    add_foreign_key :coarse_woody_debris_values, :cwd_sub_transects

  end
end
