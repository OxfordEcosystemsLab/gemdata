class CreateCsvTables < ActiveRecord::Migration

  def change

    create_table :ingrowth_core_imports do |t|
      t.string :plot_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.string :ingrowth_core_num, null: false
      t.integer :time_step, null: false
      t.integer :time_step_minutes, null: false
      t.string :is_stock_yn, null: false
      t.integer :collection_period_days, null: false
      t.float :ingrowth_core_litterfall_g
      t.float :soil_humidity_pcnt
      t.float :soil_temperature_c
      t.float :ol_under_2mm_g
      t.float :ml_under_2mm_g
      t.string :quality_code, null: false
      t.string :status, null: false
      t.text :comments
      t.timestamps
    end

    create_table :coarse_woody_debris_imports do |t|
      t.string :plot_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.string :transect_num, null: false
      t.string :sub_transect_num, null: false
      t.float :sub_transect_area_m2, null: false
      t.string :sub_transect_start_point
      t.string :sub_transect_end_point
      t.string :cwd_num, null: false
      t.string :size_class
      t.string :decay_class
      t.integer :collection_period_days, null: false
      t.float :diameter_1_cm
      t.float :diameter_2_cm
      t.float :length_cm
      t.float :dry_weight_g
      t.string :quality_code, null: false
      t.string :status, null: false
      t.text :comments
      t.timestamps
    end

    create_table :leaf_area_index_imports do |t|
      t.string :plot_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.float :true_lai
      t.float :average_leaf_inclination_angle
      t.float :recalculated_lai
      t.float :std_dev
      t.string :quality_code, null: false
      t.string :status, null: false
      t.text :comments
      t.timestamps
    end

    create_table :fine_litterfall_imports do |t|
      t.string :plot_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.string :litterfall_trap_num, null: false
      t.float :litterfall_trap_size_m2, null: false
      t.integer :collection_period_days, null: false
      t.float :leaves_g_per_trap
      t.float :twigs_g_per_trap
      t.float :flowers_g_per_trap
      t.float :fruits_g_per_trap
      t.float :bromeliads_g_per_trap
      t.float :epiphytes_g_per_trap
      t.float :other_g_per_trap
      t.float :palm_leaves_g
      t.float :palm_flower_g
      t.float :palm_fruit_g
      t.string :quality_code, null: false
      t.string :status, null: false
      t.text :comments
      t.timestamps
    end

    create_table :leaf_respiration_imports do |t|
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
      t.string :quality_code, null: false
      t.string :status, null: false
      t.text :comments
      t.timestamps
    end

    create_table :respiration_control_imports do |t|
      t.string :plot_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.string :measurement_code, null: false
      t.string :plot_corner_code
      t.string :disturbance_code, null: false
      t.float :co2_ref_ppm
      t.float :pressure_mb
      t.float :air_temp_c
      t.float :soil_temp_c
      t.float :depth_cm
      t.float :vwc_pcnt
      t.float :delta_flux
      t.string :quality_code, null: false
      t.string :status, null: false
      t.text :comments
      t.timestamps
    end

    create_table :respiration_partitioning_imports do |t|
      t.string :plot_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.string :measurement_code, null: false
      t.string :plot_corner_code, null: false
      t.float :co2_ref_ppm
      t.float :pressure_mb
      t.float :air_temp_c
      t.float :soil_temp_c
      t.float :depth_cm
      t.float :vwc_pcnt
      t.float :delta_flux
      t.string :quality_code, null: false
      t.string :status, null: false
      t.text :comments
      t.timestamps
    end

    create_table :small_stem_imports do |t|
      t.string :plot_code, null: false
      t.string :sub_plot
      t.string :tree_tag, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.integer :growth_period_days, null: false
      t.float :wood_density_g_m2
      t.float :tree_height_m
      t.float :pom_height_m
      t.float :dbh_mm
      t.string :quality_code, null: false
      t.string :status, null: false
      t.text :comments
      t.timestamps
    end

    create_table :stem_respiration_imports do |t|
      t.string :plot_code, null: false
      t.string :sub_plot
      t.string :tree_tag, null: false
      t.string :tube_num
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.float :co2_ref_ppm
      t.float :pressure_mb
      t.float :air_temp_c
      t.float :depth_cm
      t.float :delta_flux
      t.string :quality_code, null: false
      t.string :status, null: false
      t.text :comments
      t.timestamps
    end

    create_table :dendrometer_imports do |t|
      t.string :plot_code, null: false
      t.string :sub_plot
      t.string :tree_tag, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day
      t.integer :growth_period_days, null: false
      t.float :pom_height_m
      t.integer :dbh_first_year
      t.float :dbh_first_year_mm
      t.float :dendrometer_reading_mm
      t.string :quality_code, null: false
      t.string :status, null: false
      t.text :comments
      t.timestamps
    end

    create_table :monthly_averages_imports do |t|
      t.string :plot_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.float :npp_fineroot_mgc_ha_mo
      t.float :npp_fineroot_se
      t.float :npp_woody_mgc_ha_mo
      t.float :npp_woody_se
      t.float :cwd_mgc_ha_mo
      t.float :cwd_se
      t.float :respiration_auto_mgc_ha_mo
      t.float :respiration_auto_se
      t.float :respiration_hetero_mgc_ha_mo
      t.float :respiration_hetero_se
      t.float :respiration_setm_mgc_ha_mo
      t.float :respiration_setm_se
      t.float :lai_units
      t.float :lai_se
      t.float :respiration_leaf_mgc_ha_mo
      t.float :respiration_leaf_se
      t.float :litterfall_total
      t.float :litterfall_total_se
      t.float :litterfall_fruit
      t.float :litterfall_fruit_se
      t.float :litterfall_flower
      t.float :litterfall_flower_se
      t.float :litterfall_reproductive
      t.float :litterfall_reproductive_se
      t.float :litterfall_branch
      t.float :litterfall_branch_se
      t.float :litterfall_leaf
      t.float :litterfall_leaf_se
      t.float :litterfall_other
      t.float :litterfall_other_se
      t.string :quality_code, null: false
      t.string :status, null: false
      t.text :comments
      t.timestamps
    end

  end

end
