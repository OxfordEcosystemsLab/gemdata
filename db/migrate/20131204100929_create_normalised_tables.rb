class CreateNormalisedTables < ActiveRecord::Migration

  def change

    # Plot sturcture

    create_table :global_regions do |t|
      t.string :global_region_code, null: false
      t.string :global_region_name
      t.timestamps
    end

    create_table :regions do |t|
      t.references :global_region, null: false
      t.string :region_code, null: false
      t.string :region_name
      t.timestamps
    end
    add_foreign_key :regions, :global_regions
    add_index :regions, :global_region_id

    create_table :countries do |t|
      t.string :country_code, null: false
      t.string :country_name
      t.timestamps
    end

    create_table :region_countries do |t|
      t.references :region, null: false
      t.references :country, null: false
      t.string :region_country_code, null: false
      t.string :region_country_name
      t.timestamps
    end
    add_foreign_key :region_countries, :regions
    add_index :region_countries, :region_id
    add_foreign_key :region_countries, :countries
    add_index :region_countries, :country_id

    create_table :sites do |t|
      t.references :region_country, null: false
      t.string :site_code, null: false
      t.string :site_name
      t.timestamps
    end
    add_foreign_key :sites, :region_countries
    add_index :sites, :region_country_id

    # Allow null site so as to not block plot data without the site having been setup yet
    create_table :plots do |t|
      t.references :site
      t.string :plot_code, null: false
      t.string :plot_desc
      t.float :latitude
      t.float :longitude
      t.float :ne_latitude
      t.float :ne_longitude
      t.float :nw_latitude
      t.float :nw_longitude
      t.float :se_latitude
      t.float :se_longitude
      t.float :sw_latitude
      t.float :sw_longitude
      t.string :plot_shape
      t.float :plot_area_m2
      t.float :elevation_m
      t.float :slope_deg
      t.float :aspect_deg
      t.string :start_date_rainfor
      t.string :start_date_ccycle
      t.string :end_date_ccycle
      t.string :data_collected_code
      t.string :data_collection_list
      t.string :small_stem_plot_area
      t.float :cwd_transect_area_m2
      t.string :partitionning_collars_installation_date
      t.string :disturbances
      t.timestamps
    end
    add_foreign_key :plots, :sites
    add_index :plots, :site_id

    create_table :sub_plots do |t|
      t.references :plot, null: false
      t.string :sub_plot_code, null: false
      t.string :sub_plot_type, null: false # Standard grid or small stem
      t.float :sub_plot_area_m2, null: false # Not null ?
      t.timestamps
    end
    add_foreign_key :sub_plots, :plots
    add_index :sub_plots, :plot_id

    create_table :trees do |t|
      t.references :sub_plot, null: false
      t.string :tree_code, null: false
      t.string :tree_class, null: false # Small or large
      t.timestamps
    end
    add_foreign_key :trees, :sub_plots
    add_index :trees, :sub_plot_id

    # People

    create_table :people do |t|
      t.string :person_name, null: false
      t.string :person_email
      t.timestamps
    end

    create_table :people_roles do |t|
      t.references :person, null: false
      t.references :plot, null: false
      t.timestamps
    end
    add_foreign_key :people_roles, :people
    add_index :people_roles, :person_id
    add_foreign_key :people_roles, :plots
    add_index :people_roles, :plot_id

    # Ingrowth Cores

    create_table :ingrowth_cores do |t|
      t.string :ingrowth_core_num, null: false
      t.references :plot, null: false
      t.timestamps
    end
    add_foreign_key :ingrowth_cores, :plots
    add_index :ingrowth_cores, :plot_id

    create_table :ingrowth_core_values do |t|
      t.references :ingrowth_core, null: false
      t.datetime :collection_date, null: false
      t.integer :collection_period_days, null: false
      t.integer :time_step, null: false
      t.integer :time_step_minutes, null: false
      t.string :is_stock_yn, null: false
      t.float :ingrowth_core_litterfall_g
      t.float :soil_humidity_pcnt
      t.float :soil_temperature_c
      t.float :ol_under_2mm_g
      t.float :ml_under_2mm_g
      t.string :quality_code, null: false
      t.text :comments
      t.timestamps
    end
    add_foreign_key :ingrowth_core_values, :ingrowth_cores
    add_index :ingrowth_core_values, :ingrowth_core_id

    # Coarse Woody Debris

    create_table :cwd_transects do |t|
      t.string :cwd_transect_num, null: false
      t.references :plot, null: false
      t.timestamps
    end
    add_foreign_key :cwd_transects, :plots
    add_index :cwd_transects, :plot_id

    create_table :cwd_sub_transects do |t|
      t.string :cwd_sub_transects_num, null: false
      t.references :cwd_transect, null: false
      t.float :sub_transect_area_m2, null: false
      t.string :sub_transect_start_point
      t.string :sub_transect_end_point
      t.timestamps
    end
    add_foreign_key :cwd_sub_transects, :cwd_transects
    add_index :cwd_sub_transects, :cwd_transect_id

    create_table :coarse_woody_debris_values do |t|
      t.references :cwd_sub_transect, null: false
      t.datetime :collection_date, null: false
      t.integer :collection_period_days, null: false
      t.string :cwd_num, null: false
      t.string :size_class
      t.string :decay_class
      t.float :diameter_1_cm
      t.float :diameter_2_cm
      t.float :length_cm
      t.float :dry_weight_g
      t.string :quality_code, null: false
      t.text :comments
      t.timestamps
    end
    add_foreign_key :coarse_woody_debris_values, :cwd_sub_transects
    add_index :coarse_woody_debris_values, :cwd_sub_transect_id

    # Leaf Area Index

    create_table :leaf_area_index_values do |t|
      t.references :plot, null: false
      t.datetime :reading_date, null: false
      t.float :true_lai
      t.float :average_leaf_inclination_angle
      t.float :recalculated_lai
      t.float :std_dev
      t.string :quality_code, null: false
      t.text :comments
      t.timestamps
    end
    add_foreign_key :leaf_area_index_values, :plots
    add_index :leaf_area_index_values, :plot_id

    # Fine Litterfall

    create_table :litterfall_traps do |t|
      t.references :plot, null: false
      t.string :litterfall_trap_num, null: false
      t.float :litterfall_trap_size_m2, null: false
    end
    add_foreign_key :litterfall_traps, :plots
    add_index :litterfall_traps, :plot_id

    create_table :fine_litterfall_values do |t|
      t.references :litterfall_trap, null: false
      t.datetime :collection_date, null: false
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
      t.text :comments
      t.timestamps
    end
    add_foreign_key :fine_litterfall_values, :litterfall_traps
    add_index :fine_litterfall_values, :litterfall_trap_id

    # Respiration

    create_table :soil_respiration_tubes do |t|
      t.references :plot, null: false
      t.string :tube_code, null: false
      t.string :plot_corner_code, null: false
      t.timestamps
    end
    add_foreign_key :soil_respiration_tubes, :plots
    add_index :soil_respiration_tubes, :plot_id

    create_table :soil_respiration_values do |t|
      t.references :soil_respiration_tube, null: false
      t.datetime :reading_date, null: false
      t.string :measurement_type, null: false # control, partitioning
      t.string :disturbance_code, null: false
      t.float :co2_ref_ppm
      t.float :pressure_mb
      t.float :air_temp_c
      t.float :soil_temp_c
      t.float :depth_cm
      t.float :vwc_pcnt
      t.float :delta_flux
      t.string :quality_code, null: false
      t.text :comments
      t.timestamps
    end
    add_foreign_key :soil_respiration_values, :soil_respiration_tubes
    add_index :soil_respiration_values, :soil_respiration_tube_id

    create_table :stem_respiration_values do |t|
      t.references :tree, null: false
      t.datetime :reading_date, null: false
      t.string :tube_num
      t.float :co2_ref_ppm
      t.float :pressure_mb
      t.float :air_temp_c
      t.float :depth_cm
      t.float :delta_flux
      t.string :quality_code, null: false
      t.text :comments
      t.timestamps
    end
    add_foreign_key :stem_respiration_values, :trees
    add_index :stem_respiration_values, :tree_id

    create_table :leaf_respiration_values do |t|
      t.references :tree, null: false
      t.datetime :reading_date, null: false
      t.float :correction
      t.float :a_sun
      t.float :a_shade
      t.float :resp_sun
      t.float :resp_shade
      t.string :quality_code, null: false
      t.text :comments
      t.timestamps
    end
    add_foreign_key :leaf_respiration_values, :trees
    add_index :leaf_respiration_values, :tree_id

    # Tree measurements

    create_table :small_stem_values do |t|
      t.references :tree, null: false
      t.datetime :reading_date, null: false
      t.integer :growth_period_days, null: false
      t.float :pom_height_m
      t.float :dbh_mm
      t.float :tree_height_m
      t.float :wood_density_g_m2
      t.string :quality_code, null: false
      t.text :comments
      t.timestamps
    end
    add_foreign_key :small_stem_values, :trees
    add_index :small_stem_values, :tree_id

    create_table :dendrometer_values do |t|
      t.references :tree, null: false
      t.datetime :reading_date, null: false
      t.integer :growth_period_days, null: false
      t.float :pom_height_m
      t.integer :dbh_first_year
      t.float :dbh_first_year_mm
      t.float :dendrometer_reading_mm
      t.string :quality_code, null: false
      t.text :comments
      t.timestamps
    end
    add_foreign_key :dendrometer_values, :trees
    add_index :dendrometer_values, :tree_id

  end

end
