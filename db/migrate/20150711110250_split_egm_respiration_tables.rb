class SplitEgmRespirationTables < ActiveRecord::Migration
  def change

    drop_table :egm_respiration_values
    drop_table :egm_respiration_collars

    create_table :egm_respiration_collars do |t|
      t.string     :collar_type,            index: true, null: false # soil, stem, ic
      t.references :plot,                   index: true, null: false
      t.references :sub_plot,               index: true
      t.references :tree,                   index: true
      t.string     :collar_num
      t.string     :plot_corner_code
      t.integer    :batch_id
      t.timestamps
    end
    add_foreign_key :egm_respiration_collars, :plots
    add_foreign_key :egm_respiration_collars, :sub_plots
    add_foreign_key :egm_respiration_collars, :trees

    create_table :egm_respiration_values do |t|
      t.string     :respiration_value_type, index: true, null: false # soil, stem, cwd, ic, leaf
      t.references :plot,                   index: true, null: false
      t.references :sub_plot,               index: true              # For cwd
      t.references :tree,                   index: true              # For stem
      t.references :egm_respiration_collar, index: true
      t.references :ingrowth_core,          index: true
      t.references :cwd_transect,           index: true
      t.references :cwd_sub_transect,       index: true
      t.string     :cwd_num,                index: true              # No metadata table for this
      t.datetime   :datetime,                            null: false
      t.string     :measurement_code
      t.string     :treatment_code
      t.string     :litter_code
      t.string     :disturbance_code
      t.integer    :replica
      t.float      :egm_measurement
      t.float      :recno
      t.float      :co2ref_ppm
      t.float      :inputd
      t.float      :time
      t.float      :inputf
      t.float      :atmp_mb
      t.float      :probe_type
      t.string     :quality_code
      t.text       :comments
      t.integer    :batch_id
      t.timestamps
    end
    add_foreign_key :egm_respiration_values, :plots
    add_foreign_key :egm_respiration_values, :sub_plots
    add_foreign_key :egm_respiration_values, :trees
    add_foreign_key :egm_respiration_values, :egm_respiration_collars
    add_foreign_key :egm_respiration_values, :ingrowth_cores
    add_foreign_key :egm_respiration_values, :cwd_transects
    add_foreign_key :egm_respiration_values, :cwd_sub_transects
    
  end
end
