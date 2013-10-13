class CreateCsvTables < ActiveRecord::Migration

  def change

    create_table :ingrowth_core_values do |t|
      t.string :plot_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.string :ingrowth_core_number, null: false
      t.integer :time_step, null: false
      t.float :ingrowth_core_litterfall_g
      t.float :soil_humidity_pcnt
      t.float :soil_temperature_c
      t.float :ol_under_2mm_g
      t.float :ml_under_2mm_g
      t.string :status, default: Lookup::RowStatus.imported
      t.text :comments
      t.timestamps
    end

    create_table :coarse_woody_debris_values do |t|
      t.string :plot_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.string :transect_num, null: false
      t.string :sub_transect_num
      t.string :cwd_num, null: false
      t.string :size_class, null: false
      t.float :diameter_1_cm
      t.float :diameter_2_cm
      t.float :length_cm
      t.float :dry_weight_g
      t.string :status, default: Lookup::RowStatus.imported
      t.text :comments
      t.timestamps
    end

    create_table :leaf_area_index_values do |t|
      t.string :plot_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.float :true_lai
      t.float :average_leaf_inclination_angle
      t.float :recalculated_lai
      t.float :std_dev
      t.string :status, default: Lookup::RowStatus.imported
      t.text :comments
      t.timestamps
    end

    create_table :fine_litterfall_values do |t|
      t.string :plot_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.string :collector_num, null: false
      t.float :leaves_g
      t.float :twigs_g
      t.float :flowers_g
      t.float :fruits_g
      t.float :bromeliads_g
      t.float :epiphytes_g
      t.float :other_g
      t.float :palm_leaves_g
      t.float :palm_flower_g
      t.float :palm_fruit_g
      t.string :status, default: Lookup::RowStatus.imported
      t.text :comments
      t.timestamps
    end

    create_table :leaf_respiration_values do |t|
      t.string :plot_code, null: false
      t.string :tree_tag, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.float :correction
      t.float :a_sun
      t.float :a_shade
      t.float :resp_sun
      t.float :resp_shade
      t.string :status, default: Lookup::RowStatus.imported
      t.text :comments
      t.timestamps
    end

    create_table :respiration_control_values do |t|
      t.string :plot_code, null: false
      t.string :measurement_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.boolean :disturbed_yn, null: false
      t.float :co2_ref_ppm
      t.float :pressure_mb
      t.float :air_temp_c
      t.float :depth_cm
      t.float :vwc_pcnt
      t.float :delta_flux
      t.string :status, default: Lookup::RowStatus.imported
      t.text :comments
      t.timestamps
    end

    create_table :respiration_partitioning_values do |t|
      t.string :plot_code, null: false
      t.string :measurement_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.float :co2_ref_ppm
      t.float :pressure_mb
      t.float :air_temp_c
      t.float :depth_cm
      t.float :vwc_pcnt
      t.float :delta_flux
      t.string :status, default: Lookup::RowStatus.imported
      t.text :comments
      t.timestamps
    end

    create_table :small_stem_values do |t|
      t.string :plot_code, null: false
      t.string :sub_plot
      t.string :tree_tag, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.float :wood_density_g_m2
      t.float :tree_height_m
      t.float :dbh_height_m
      t.float :dbh_cm
      t.string :status, default: Lookup::RowStatus.imported
      t.text :comments
      t.timestamps
    end

    create_table :stem_respiration_values do |t|
      t.string :plot_code, null: false
      t.string :sub_plot
      t.string :tree_tag, null: false
      t.string :tube_num, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.float :co2_ref_ppm
      t.float :pressure_mb
      t.float :air_temp_c
      t.float :depth_cm
      t.float :delta_flux
      t.string :status, default: Lookup::RowStatus.imported
      t.text :comments
      t.timestamps
    end

    create_table :dendrometer_values do |t|
      t.string :plot_code, null: false
      t.string :sub_plot
      t.string :tree_tag, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.float :tree_height_m
      t.float :dbh_height_m
      t.float :dbh_cm
      t.string :status, default: Lookup::RowStatus.imported
      t.text :comments
      t.timestamps
    end

  end

end
