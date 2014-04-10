# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140415221308) do

  create_table "arizonas", force: true do |t|
    t.integer  "leaf_id"
    t.datetime "date"
    t.string   "evaluators"
    t.float    "fresh_mass"
    t.float    "dry_mass"
    t.float    "thickness"
    t.float    "petiole_width"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "arizonas", ["leaf_id"], name: "index_arizonas_on_leaf_id"

  create_table "branch_architectures", force: true do |t|
    t.integer  "branch_id"
    t.datetime "date"
    t.string   "evaluator"
    t.integer  "section"
    t.integer  "parent"
    t.string   "tip"
    t.float    "diam_inf"
    t.float    "diam_sup"
    t.float    "longitude"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branch_architectures", ["branch_id"], name: "index_branch_architectures_on_branch_id"

<<<<<<< HEAD
  create_table "branch_light_measurements", force: true do |t|
    t.integer  "branch_light_placement_id"
    t.integer  "number"
    t.datetime "datetime"
    t.float    "measurement"
    t.float    "photons"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branch_light_measurements", ["branch_light_placement_id"], name: "index_branch_light_measurements_on_branch_light_placement_id"

=======
>>>>>>> Generate branch light placement model
  create_table "branch_light_placements", force: true do |t|
    t.integer  "branch_id"
    t.integer  "weather_id"
    t.string   "sun_shade"
    t.string   "pic1"
    t.string   "pic2"
    t.string   "pic3"
    t.float    "hd_pic"
    t.float    "alt_pic"
    t.float    "az_pic"
    t.float    "az_branch"
    t.float    "vd_branch"
    t.float    "hd_branch"
    t.float    "vground_branch"
    t.string   "light_cond"
    t.string   "liana_cov"
    t.string   "note"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branch_light_placements", ["branch_id"], name: "index_branch_light_placements_on_branch_id"
  add_index "branch_light_placements", ["weather_id"], name: "index_branch_light_placements_on_weather_id"

  create_table "branches", force: true do |t|
    t.string   "code"
    t.integer  "traits_tree_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branches", ["code"], name: "index_branches_on_code", unique: true
  add_index "branches", ["traits_tree_id"], name: "index_branches_on_traits_tree_id"

  create_table "coarse_woody_debris_imports", force: true do |t|
    t.string   "plot_code",                null: false
    t.integer  "year",                     null: false
    t.integer  "month",                    null: false
    t.integer  "day"
    t.string   "transect_num",             null: false
    t.string   "sub_transect_num",         null: false
    t.float    "sub_transect_area_m2",     null: false
    t.string   "sub_transect_start_point"
    t.string   "sub_transect_end_point"
    t.string   "cwd_num",                  null: false
    t.string   "size_class"
    t.string   "decay_class"
    t.integer  "collection_period_days",   null: false
    t.float    "diameter_1_cm"
    t.float    "diameter_2_cm"
    t.float    "length_cm"
    t.float    "dry_weight_g"
    t.string   "quality_code",             null: false
    t.string   "status",                   null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coarse_woody_debris_values", force: true do |t|
    t.integer  "cwd_sub_transect_id",    null: false
    t.datetime "collection_date",        null: false
    t.integer  "collection_period_days", null: false
    t.string   "cwd_num",                null: false
    t.string   "size_class"
    t.string   "decay_class"
    t.float    "diameter_1_cm"
    t.float    "diameter_2_cm"
    t.float    "length_cm"
    t.float    "dry_weight_g"
    t.string   "quality_code",           null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coarse_woody_debris_values", ["cwd_sub_transect_id"], name: "index_coarse_woody_debris_values_on_cwd_sub_transect_id"

  create_table "countries", force: true do |t|
    t.string   "country_code", null: false
    t.string   "country_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cwd_sub_transects", force: true do |t|
    t.string   "cwd_sub_transects_num",    null: false
    t.integer  "cwd_transect_id",          null: false
    t.float    "sub_transect_area_m2",     null: false
    t.string   "sub_transect_start_point"
    t.string   "sub_transect_end_point"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cwd_sub_transects", ["cwd_transect_id", "cwd_sub_transects_num"], name: "index_cwd_sub_transects_on_transect_and_sub_transect", unique: true
  add_index "cwd_sub_transects", ["cwd_transect_id"], name: "index_cwd_sub_transects_on_cwd_transect_id"

  create_table "cwd_transects", force: true do |t|
    t.string   "cwd_transect_num", null: false
    t.integer  "plot_id",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cwd_transects", ["plot_id", "cwd_transect_num"], name: "index_cwd_transects_on_plot_id_and_cwd_transect_num", unique: true
  add_index "cwd_transects", ["plot_id"], name: "index_cwd_transects_on_plot_id"

  create_table "dendrometer_imports", force: true do |t|
    t.string   "plot_code",              null: false
    t.string   "sub_plot"
    t.string   "tree_tag",               null: false
    t.integer  "year",                   null: false
    t.integer  "month",                  null: false
    t.integer  "day"
    t.integer  "growth_period_days",     null: false
    t.float    "pom_height_m"
    t.integer  "dbh_first_year"
    t.float    "dbh_first_year_mm"
    t.float    "dendrometer_reading_mm"
    t.string   "quality_code",           null: false
    t.string   "status",                 null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dendrometer_values", force: true do |t|
    t.integer  "tree_id",                null: false
    t.datetime "reading_date",           null: false
    t.integer  "growth_period_days",     null: false
    t.float    "pom_height_m"
    t.integer  "dbh_first_year"
    t.float    "dbh_first_year_mm"
    t.float    "dendrometer_reading_mm"
    t.string   "quality_code",           null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dendrometer_values", ["tree_id"], name: "index_dendrometer_values_on_tree_id"

  create_table "fine_litterfall_imports", force: true do |t|
    t.string   "plot_code",               null: false
    t.integer  "year",                    null: false
    t.integer  "month",                   null: false
    t.integer  "day"
    t.string   "litterfall_trap_num",     null: false
    t.float    "litterfall_trap_size_m2", null: false
    t.integer  "collection_period_days",  null: false
    t.float    "leaves_g_per_trap"
    t.float    "twigs_g_per_trap"
    t.float    "flowers_g_per_trap"
    t.float    "fruits_g_per_trap"
    t.float    "bromeliads_g_per_trap"
    t.float    "epiphytes_g_per_trap"
    t.float    "other_g_per_trap"
    t.float    "palm_leaves_g"
    t.float    "palm_flower_g"
    t.float    "palm_fruit_g"
    t.string   "quality_code",            null: false
    t.string   "status",                  null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fine_litterfall_values", force: true do |t|
    t.integer  "litterfall_trap_id",     null: false
    t.datetime "collection_date",        null: false
    t.integer  "collection_period_days", null: false
    t.float    "leaves_g_per_trap"
    t.float    "twigs_g_per_trap"
    t.float    "flowers_g_per_trap"
    t.float    "fruits_g_per_trap"
    t.float    "bromeliads_g_per_trap"
    t.float    "epiphytes_g_per_trap"
    t.float    "other_g_per_trap"
    t.float    "palm_leaves_g"
    t.float    "palm_flower_g"
    t.float    "palm_fruit_g"
    t.string   "quality_code",           null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fine_litterfall_values", ["litterfall_trap_id"], name: "index_fine_litterfall_values_on_litterfall_trap_id"

  create_table "fp_families", force: true do |t|
    t.integer  "apg_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fp_genus", force: true do |t|
    t.integer  "fp_family_id"
    t.integer  "fp_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fp_genus", ["fp_family_id"], name: "index_fp_genus_on_fp_family_id"

  create_table "fp_species", force: true do |t|
    t.integer  "fp_genus_id"
    t.integer  "fp_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fp_species", ["fp_genus_id"], name: "index_fp_species_on_fp_genus_id"

  create_table "global_network_imports", force: true do |t|
    t.string "global_region_code",  null: false
    t.string "global_region_name"
    t.string "region_code",         null: false
    t.string "region_name"
    t.string "country_code",        null: false
    t.string "country_name"
    t.string "country_region_code"
    t.string "country_region_name"
    t.string "site_code",           null: false
    t.string "site_name"
    t.string "plot_code",           null: false
    t.string "plot_name"
  end

  create_table "global_regions", force: true do |t|
    t.string   "global_region_code", null: false
    t.string   "global_region_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "global_regions", ["global_region_code"], name: "index_global_regions_on_global_region_code", unique: true

  create_table "ingrowth_core_imports", force: true do |t|
    t.string   "plot_code",                  null: false
    t.integer  "year",                       null: false
    t.integer  "month",                      null: false
    t.integer  "day"
    t.string   "ingrowth_core_num",          null: false
    t.integer  "time_step",                  null: false
    t.integer  "time_step_minutes",          null: false
    t.string   "is_stock_yn",                null: false
    t.integer  "collection_period_days",     null: false
    t.float    "ingrowth_core_litterfall_g"
    t.float    "soil_humidity_pcnt"
    t.float    "soil_temperature_c"
    t.float    "ol_under_2mm_g"
    t.float    "ml_under_2mm_g"
    t.string   "quality_code",               null: false
    t.string   "status",                     null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingrowth_core_values", force: true do |t|
    t.integer  "ingrowth_core_id",           null: false
    t.datetime "collection_date",            null: false
    t.integer  "collection_period_days",     null: false
    t.integer  "time_step",                  null: false
    t.integer  "time_step_minutes",          null: false
    t.string   "is_stock_yn",                null: false
    t.float    "ingrowth_core_litterfall_g"
    t.float    "soil_humidity_pcnt"
    t.float    "soil_temperature_c"
    t.float    "ol_under_2mm_g"
    t.float    "ml_under_2mm_g"
    t.string   "quality_code",               null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingrowth_core_values", ["ingrowth_core_id"], name: "index_ingrowth_core_values_on_ingrowth_core_id"

  create_table "ingrowth_cores", force: true do |t|
    t.string   "ingrowth_core_num", null: false
    t.integer  "plot_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingrowth_cores", ["plot_id", "ingrowth_core_num"], name: "index_ingrowth_cores_on_plot_id_and_ingrowth_core_num", unique: true
  add_index "ingrowth_cores", ["plot_id"], name: "index_ingrowth_cores_on_plot_id"

  create_table "leaf_area_index_imports", force: true do |t|
    t.string   "plot_code",                      null: false
    t.integer  "year",                           null: false
    t.integer  "month",                          null: false
    t.integer  "day"
    t.float    "true_lai"
    t.float    "average_leaf_inclination_angle"
    t.float    "recalculated_lai"
    t.float    "std_dev"
    t.string   "quality_code",                   null: false
    t.string   "status",                         null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leaf_area_index_values", force: true do |t|
    t.integer  "plot_id",                        null: false
    t.datetime "reading_date",                   null: false
    t.float    "true_lai"
    t.float    "average_leaf_inclination_angle"
    t.float    "recalculated_lai"
    t.float    "std_dev"
    t.string   "quality_code",                   null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leaf_area_index_values", ["plot_id"], name: "index_leaf_area_index_values_on_plot_id"

  create_table "leaf_respiration_imports", force: true do |t|
    t.string   "plot_code",    null: false
    t.string   "tree_tag",     null: false
    t.integer  "year",         null: false
    t.integer  "month",        null: false
    t.integer  "day"
    t.float    "correction"
    t.float    "a_sun"
    t.float    "a_shade"
    t.float    "resp_sun"
    t.float    "resp_shade"
    t.string   "quality_code", null: false
    t.string   "status",       null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leaf_respiration_values", force: true do |t|
    t.integer  "tree_id",      null: false
    t.datetime "reading_date", null: false
    t.float    "correction"
    t.float    "a_sun"
    t.float    "a_shade"
    t.float    "resp_sun"
    t.float    "resp_shade"
    t.string   "quality_code", null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leaf_respiration_values", ["tree_id"], name: "index_leaf_respiration_values_on_tree_id"

  create_table "leafs", force: true do |t|
    t.integer  "branch_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leafs", ["branch_id"], name: "index_leafs_on_branch_id"

  create_table "light_hangings", force: true do |t|
    t.integer  "traits_tree_id"
    t.integer  "weather_reading_id"
    t.integer  "last_sensor"
    t.float    "last_sensor_height"
    t.float    "first_sensor_to_crown_top"
    t.float    "az"
    t.float    "vd"
    t.float    "hd"
    t.string   "note"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "light_hangings", ["traits_tree_id"], name: "index_light_hangings_on_traits_tree_id"
  add_index "light_hangings", ["weather_reading_id"], name: "index_light_hangings_on_weather_reading_id"

  create_table "light_references", force: true do |t|
    t.integer  "number"
    t.datetime "datetime"
    t.float    "measurement"
    t.float    "photons"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "light_string_measurements", force: true do |t|
    t.integer  "light_string_hanging_id"
    t.datetime "datetime"
    t.integer  "record"
    t.float    "m0"
    t.float    "m0_5"
    t.float    "m1"
    t.float    "m1_5"
    t.float    "m2"
    t.float    "m2_5"
    t.float    "m3"
    t.float    "m3_5"
    t.float    "m4"
    t.float    "m4_5"
    t.float    "m5"
    t.float    "m6"
    t.float    "m7"
    t.float    "m8"
    t.float    "m9"
    t.float    "m10"
    t.float    "m11"
    t.float    "m12"
    t.float    "m13"
    t.float    "m14"
    t.float    "m15"
    t.float    "m16"
    t.float    "m17"
    t.float    "m18"
    t.float    "m19"
    t.float    "m21"
    t.float    "m22"
    t.float    "m23"
    t.float    "m24"
    t.float    "m25"
    t.float    "m26"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "light_string_measurements", ["light_string_hanging_id"], name: "index_light_string_measurements_on_light_string_hanging_id"

  create_table "litterfall_traps", force: true do |t|
    t.integer "plot_id",                 null: false
    t.string  "litterfall_trap_num",     null: false
    t.float   "litterfall_trap_size_m2", null: false
  end

  add_index "litterfall_traps", ["plot_id", "litterfall_trap_num"], name: "index_litterfall_traps_on_plot_id_and_litterfall_trap_num", unique: true
  add_index "litterfall_traps", ["plot_id"], name: "index_litterfall_traps_on_plot_id"

  create_table "monthly_averages_imports", force: true do |t|
    t.string   "plot_code",                    null: false
    t.integer  "year",                         null: false
    t.integer  "month",                        null: false
    t.float    "npp_fineroot_mgc_ha_mo"
    t.float    "npp_fineroot_se"
    t.float    "npp_woody_mgc_ha_mo"
    t.float    "npp_woody_se"
    t.float    "cwd_mgc_ha_mo"
    t.float    "cwd_se"
    t.float    "respiration_auto_mgc_ha_mo"
    t.float    "respiration_auto_se"
    t.float    "respiration_hetero_mgc_ha_mo"
    t.float    "respiration_hetero_se"
    t.float    "respiration_setm_mgc_ha_mo"
    t.float    "respiration_setm_se"
    t.float    "lai_units"
    t.float    "lai_se"
    t.float    "respiration_leaf_mgc_ha_mo"
    t.float    "respiration_leaf_se"
    t.float    "litterfall_total"
    t.float    "litterfall_total_se"
    t.float    "litterfall_fruit"
    t.float    "litterfall_fruit_se"
    t.float    "litterfall_flower"
    t.float    "litterfall_flower_se"
    t.float    "litterfall_reproductive"
    t.float    "litterfall_reproductive_se"
    t.float    "litterfall_branch"
    t.float    "litterfall_branch_se"
    t.float    "litterfall_leaf"
    t.float    "litterfall_leaf_se"
    t.float    "litterfall_other"
    t.float    "litterfall_other_se"
    t.string   "quality_code",                 null: false
    t.string   "status",                       null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "person_name",  null: false
    t.string   "person_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["person_name"], name: "index_people_on_person_name", unique: true

  create_table "people_roles", force: true do |t|
    t.integer  "person_id",  null: false
    t.integer  "plot_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people_roles", ["person_id"], name: "index_people_roles_on_person_id"
  add_index "people_roles", ["plot_id"], name: "index_people_roles_on_plot_id"

  create_table "plot_metadata_imports", force: true do |t|
    t.string   "plot_code",                               null: false
    t.float    "latitude"
    t.float    "longitude"
    t.float    "ne_latitude"
    t.float    "ne_longitude"
    t.float    "nw_latitude"
    t.float    "nw_longitude"
    t.float    "se_latitude"
    t.float    "se_longitude"
    t.float    "sw_latitude"
    t.float    "sw_longitude"
    t.string   "plot_shape"
    t.float    "plot_area_m2"
    t.float    "elevation_m"
    t.float    "slope_deg"
    t.float    "aspect_deg"
    t.string   "principal_investigator"
    t.string   "data_manager"
    t.string   "field_manager"
    t.string   "field_researchers"
    t.string   "start_date_rainfor"
    t.string   "start_date_ccycle"
    t.string   "end_date_ccycle"
    t.string   "data_collected_code"
    t.string   "data_collection_list"
    t.string   "small_stem_plot_area"
    t.float    "cwd_transect_area_m2"
    t.string   "partitionning_collars_installation_date"
    t.string   "disturbances"
    t.string   "status",                                  null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plots", force: true do |t|
    t.integer  "site_id"
    t.string   "plot_code",                               null: false
    t.string   "plot_desc"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "ne_latitude"
    t.float    "ne_longitude"
    t.float    "nw_latitude"
    t.float    "nw_longitude"
    t.float    "se_latitude"
    t.float    "se_longitude"
    t.float    "sw_latitude"
    t.float    "sw_longitude"
    t.string   "plot_shape"
    t.float    "plot_area_m2"
    t.float    "elevation_m"
    t.float    "slope_deg"
    t.float    "aspect_deg"
    t.string   "start_date_rainfor"
    t.string   "start_date_ccycle"
    t.string   "end_date_ccycle"
    t.string   "data_collected_code"
    t.string   "data_collection_list"
    t.string   "small_stem_plot_area"
    t.float    "cwd_transect_area_m2"
    t.string   "partitionning_collars_installation_date"
    t.string   "disturbances"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fp_id"
  end

  add_index "plots", ["plot_code"], name: "index_plots_on_plot_code", unique: true
  add_index "plots", ["site_id"], name: "index_plots_on_site_id"

  create_table "region_countries", force: true do |t|
    t.integer  "region_id",           null: false
    t.integer  "country_id",          null: false
    t.string   "region_country_code", null: false
    t.string   "region_country_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "region_countries", ["country_id"], name: "index_region_countries_on_country_id"
  add_index "region_countries", ["region_country_code"], name: "index_region_countries_on_region_country_code", unique: true
  add_index "region_countries", ["region_id"], name: "index_region_countries_on_region_id"

  create_table "regions", force: true do |t|
    t.integer  "global_region_id", null: false
    t.string   "region_code",      null: false
    t.string   "region_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "regions", ["global_region_id"], name: "index_regions_on_global_region_id"
  add_index "regions", ["region_code"], name: "index_regions_on_region_code", unique: true

  create_table "respiration_control_imports", force: true do |t|
    t.string   "plot_code",        null: false
    t.integer  "year",             null: false
    t.integer  "month",            null: false
    t.integer  "day"
    t.string   "measurement_code", null: false
    t.string   "plot_corner_code"
    t.string   "disturbance_code", null: false
    t.float    "co2_ref_ppm"
    t.float    "pressure_mb"
    t.float    "air_temp_c"
    t.float    "soil_temp_c"
    t.float    "depth_cm"
    t.float    "vwc_pcnt"
    t.float    "delta_flux"
    t.string   "quality_code",     null: false
    t.string   "status",           null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "respiration_partitioning_imports", force: true do |t|
    t.string   "plot_code",        null: false
    t.integer  "year",             null: false
    t.integer  "month",            null: false
    t.integer  "day"
    t.string   "measurement_code", null: false
    t.string   "plot_corner_code", null: false
    t.float    "co2_ref_ppm"
    t.float    "pressure_mb"
    t.float    "air_temp_c"
    t.float    "soil_temp_c"
    t.float    "depth_cm"
    t.float    "vwc_pcnt"
    t.float    "delta_flux"
    t.string   "quality_code",     null: false
    t.string   "status",           null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: true do |t|
    t.integer  "region_country_id", null: false
    t.string   "site_code",         null: false
    t.string   "site_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["region_country_id"], name: "index_sites_on_region_country_id"
  add_index "sites", ["site_code"], name: "index_sites_on_site_code", unique: true

  create_table "small_stem_imports", force: true do |t|
    t.string   "plot_code",          null: false
    t.string   "sub_plot"
    t.string   "tree_tag",           null: false
    t.integer  "year",               null: false
    t.integer  "month",              null: false
    t.integer  "day"
    t.integer  "growth_period_days", null: false
    t.float    "wood_density_g_m2"
    t.float    "tree_height_m"
    t.float    "pom_height_m"
    t.float    "dbh_mm"
    t.string   "quality_code",       null: false
    t.string   "status",             null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "small_stem_values", force: true do |t|
    t.integer  "tree_id",            null: false
    t.datetime "reading_date",       null: false
    t.integer  "growth_period_days", null: false
    t.float    "pom_height_m"
    t.float    "dbh_mm"
    t.float    "tree_height_m"
    t.float    "wood_density_g_m2"
    t.string   "quality_code",       null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "small_stem_values", ["tree_id"], name: "index_small_stem_values_on_tree_id"

  create_table "soil_respiration_tubes", force: true do |t|
    t.integer  "plot_id",          null: false
    t.string   "tube_code",        null: false
    t.string   "plot_corner_code", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "soil_respiration_tubes", ["plot_id", "tube_code", "plot_corner_code"], name: "index_soil_respiration_tubes_on_plot_and_tube_info", unique: true
  add_index "soil_respiration_tubes", ["plot_id"], name: "index_soil_respiration_tubes_on_plot_id"

  create_table "soil_respiration_values", force: true do |t|
    t.integer  "soil_respiration_tube_id", null: false
    t.datetime "reading_date",             null: false
    t.string   "measurement_type",         null: false
    t.string   "disturbance_code",         null: false
    t.float    "co2_ref_ppm"
    t.float    "pressure_mb"
    t.float    "air_temp_c"
    t.float    "soil_temp_c"
    t.float    "depth_cm"
    t.float    "vwc_pcnt"
    t.float    "delta_flux"
    t.string   "quality_code",             null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "soil_respiration_values", ["soil_respiration_tube_id"], name: "index_soil_respiration_values_on_soil_respiration_tube_id"

  create_table "stem_respiration_imports", force: true do |t|
    t.string   "plot_code",    null: false
    t.string   "sub_plot"
    t.string   "tree_tag",     null: false
    t.string   "tube_num"
    t.integer  "year",         null: false
    t.integer  "month",        null: false
    t.integer  "day"
    t.float    "co2_ref_ppm"
    t.float    "pressure_mb"
    t.float    "air_temp_c"
    t.float    "depth_cm"
    t.float    "delta_flux"
    t.string   "quality_code", null: false
    t.string   "status",       null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stem_respiration_values", force: true do |t|
    t.integer  "tree_id",      null: false
    t.datetime "reading_date", null: false
    t.string   "tube_num"
    t.float    "co2_ref_ppm"
    t.float    "pressure_mb"
    t.float    "air_temp_c"
    t.float    "depth_cm"
    t.float    "delta_flux"
    t.string   "quality_code", null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stem_respiration_values", ["tree_id"], name: "index_stem_respiration_values_on_tree_id"

  create_table "sub_plots", force: true do |t|
    t.integer  "plot_id",          null: false
    t.string   "sub_plot_code",    null: false
    t.string   "sub_plot_type",    null: false
    t.float    "sub_plot_area_m2", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_plots", ["plot_id", "sub_plot_code"], name: "index_sub_plots_on_plot_id_and_sub_plot_code", unique: true
  add_index "sub_plots", ["plot_id"], name: "index_sub_plots_on_plot_id"

  create_table "toughness_measurements", force: true do |t|
    t.integer  "branch_id", null: false
    t.datetime "date",      null: false
    t.string   "evaluator"
    t.string   "replica"
    t.float    "thickness"
    t.float    "width"
    t.integer  "lines"
    t.float    "punch"
  end

  add_index "toughness_measurements", ["branch_id"], name: "index_toughness_measurements_on_branch_id"

  create_table "traits_trees", force: true do |t|
    t.string   "code"
    t.integer  "plot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fp_species_id"
    t.integer  "fp_id"
  end

  add_index "traits_trees", ["code"], name: "index_traits_trees_on_code", unique: true
  add_index "traits_trees", ["fp_species_id"], name: "index_traits_trees_on_fp_species_id"

  create_table "trees", force: true do |t|
    t.integer  "sub_plot_id", null: false
    t.string   "tree_code",   null: false
    t.string   "tree_class",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trees", ["sub_plot_id"], name: "index_trees_on_sub_plot_id"

  create_table "weather_readings", force: true do |t|
    t.integer  "plot_id"
    t.datetime "datetime"
    t.integer  "clouds"
    t.string   "light"
    t.string   "rain"
    t.string   "note"
    t.string   "second_note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weather_readings", ["plot_id"], name: "index_weather_readings_on_plot_id"

  create_table "wood_densities", force: true do |t|
    t.integer  "branch_id"
    t.datetime "date"
    t.string   "evaluator"
    t.string   "branch_number"
    t.float    "volume"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wood_densities", ["branch_id"], name: "index_wood_densities_on_branch_id"

end
