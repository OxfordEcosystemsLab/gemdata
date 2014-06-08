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

ActiveRecord::Schema.define(version: 20140608194537) do

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

  add_index "arizonas", ["leaf_id"], name: "index_arizonas_on_leaf_id", using: :btree

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

  add_index "branch_architectures", ["branch_id"], name: "index_branch_architectures_on_branch_id", using: :btree

  create_table "branch_light_measurements", force: true do |t|
    t.integer  "branch_light_placement_id"
    t.integer  "number"
    t.datetime "datetime"
    t.float    "measurement"
    t.float    "photons"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branch_light_measurements", ["branch_light_placement_id"], name: "index_branch_light_measurements_on_branch_light_placement_id", using: :btree

  create_table "branch_light_placements", force: true do |t|
    t.integer  "branch_id"
    t.integer  "weather_reading_id"
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

  add_index "branch_light_placements", ["branch_id"], name: "index_branch_light_placements_on_branch_id", using: :btree
  add_index "branch_light_placements", ["weather_reading_id"], name: "index_branch_light_placements_on_weather_reading_id", using: :btree

  create_table "branches", force: true do |t|
    t.string   "code",       null: false
    t.integer  "tree_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branches", ["code"], name: "index_branches_on_code", unique: true, using: :btree
  add_index "branches", ["tree_id"], name: "index_branches_on_tree_id", using: :btree

  create_table "censuses", force: true do |t|
    t.integer  "number"
    t.string   "mean_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "plot_id"
  end

  add_index "censuses", ["plot_id"], name: "censuses_plot_id_fk", using: :btree

  create_table "cn_curves", force: true do |t|
    t.float    "c_enr_1"
    t.float    "n_enr_1"
    t.float    "c_percent_1"
    t.float    "n_percent_1"
    t.float    "cn_ratio_1"
    t.float    "c_enr_2"
    t.float    "n_enr_2"
    t.float    "c_percent_2"
    t.float    "n_percent_2"
    t.float    "cn_ratio_2"
    t.float    "c_enr_3"
    t.float    "n_enr_3"
    t.float    "c_percent_3"
    t.float    "n_percent_3"
    t.float    "cn_ratio_3"
    t.float    "c_enr_4"
    t.float    "n_enr_4"
    t.float    "c_percent_4"
    t.float    "n_percent_4"
    t.float    "cn_ratio_4"
    t.float    "c_enr_5"
    t.float    "n_enr_5"
    t.float    "c_percent_5"
    t.float    "n_percent_5"
    t.float    "cn_ratio_5"
    t.float    "c_enr_6"
    t.float    "n_enr_6"
    t.float    "c_percent_6"
    t.float    "n_percent_6"
    t.float    "cn_ratio_6"
    t.float    "c_enr_7"
    t.float    "n_enr_7"
    t.float    "c_percent_7"
    t.float    "n_percent_7"
    t.float    "cn_ratio_7"
    t.float    "c_enr_8"
    t.float    "n_enr_8"
    t.float    "c_percent_8"
    t.float    "n_percent_8"
    t.float    "cn_ratio_8"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cn_measurements", force: true do |t|
    t.integer  "cn_curve_id"
    t.integer  "leaf_id"
    t.integer  "sample"
    t.string   "row"
    t.integer  "column"
    t.float    "c_percent"
    t.float    "n_percent"
    t.float    "cn_ratio"
    t.float    "n15_delta"
    t.float    "c13_delta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cn_measurements", ["cn_curve_id"], name: "index_cn_measurements_on_cn_curve_id", using: :btree
  add_index "cn_measurements", ["leaf_id"], name: "index_cn_measurements_on_leaf_id", using: :btree

  create_table "cnp_measurements", force: true do |t|
    t.integer  "leaf_id"
    t.string   "row"
    t.integer  "column"
    t.float    "c_percent"
    t.float    "n_percent"
    t.float    "cn_ratio"
    t.float    "n15_delta"
    t.float    "n13_delta"
    t.string   "cn_assays_file"
    t.float    "p_corrected_avg"
    t.float    "p_corrected_var_coef"
    t.string   "p_assays_file"
    t.integer  "box_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cnp_measurements", ["leaf_id"], name: "index_cnp_measurements_on_leaf_id", using: :btree

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

  add_index "coarse_woody_debris_values", ["cwd_sub_transect_id"], name: "index_coarse_woody_debris_values_on_cwd_sub_transect_id", using: :btree

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

  add_index "cwd_sub_transects", ["cwd_transect_id", "cwd_sub_transects_num"], name: "index_cwd_sub_transects_on_transect_and_sub_transect", unique: true, using: :btree
  add_index "cwd_sub_transects", ["cwd_transect_id"], name: "index_cwd_sub_transects_on_cwd_transect_id", using: :btree

  create_table "cwd_transects", force: true do |t|
    t.string   "cwd_transect_num", null: false
    t.integer  "plot_id",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cwd_transects", ["plot_id", "cwd_transect_num"], name: "index_cwd_transects_on_plot_id_and_cwd_transect_num", unique: true, using: :btree
  add_index "cwd_transects", ["plot_id"], name: "index_cwd_transects_on_plot_id", using: :btree

  create_table "dbh_measurements", force: true do |t|
    t.integer  "tree_id"
    t.integer  "census_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dbh_measurements", ["census_id"], name: "index_dbh_measurements_on_census_id", using: :btree
  add_index "dbh_measurements", ["tree_id"], name: "index_dbh_measurements_on_tree_id", using: :btree

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

  add_index "dendrometer_values", ["tree_id"], name: "index_dendrometer_values_on_tree_id", using: :btree

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

  add_index "fine_litterfall_values", ["litterfall_trap_id"], name: "index_fine_litterfall_values_on_litterfall_trap_id", using: :btree

  create_table "fp_families", force: true do |t|
    t.integer  "apg_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fp_genera", force: true do |t|
    t.integer  "fp_family_id"
    t.integer  "fp_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fp_genera", ["fp_family_id"], name: "index_fp_genera_on_fp_family_id", using: :btree

  create_table "fp_species", force: true do |t|
    t.integer  "fp_genus_id"
    t.integer  "fp_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fp_species", ["fp_genus_id"], name: "index_fp_species_on_fp_genus_id", using: :btree

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

  add_index "global_regions", ["global_region_code"], name: "index_global_regions_on_global_region_code", unique: true, using: :btree

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

  add_index "ingrowth_core_values", ["ingrowth_core_id"], name: "index_ingrowth_core_values_on_ingrowth_core_id", using: :btree

  create_table "ingrowth_cores", force: true do |t|
    t.string   "ingrowth_core_num", null: false
    t.integer  "plot_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingrowth_cores", ["plot_id", "ingrowth_core_num"], name: "index_ingrowth_cores_on_plot_id_and_ingrowth_core_num", unique: true, using: :btree
  add_index "ingrowth_cores", ["plot_id"], name: "index_ingrowth_cores_on_plot_id", using: :btree

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

  add_index "leaf_area_index_values", ["plot_id"], name: "index_leaf_area_index_values_on_plot_id", using: :btree

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

  add_index "leaf_respiration_values", ["tree_id"], name: "index_leaf_respiration_values_on_tree_id", using: :btree

  create_table "leaves", force: true do |t|
    t.integer  "branch_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leaves", ["branch_id"], name: "index_leaves_on_branch_id", using: :btree

  create_table "light_hangings", force: true do |t|
    t.integer  "tree_id"
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

  add_index "light_hangings", ["tree_id"], name: "index_light_hangings_on_tree_id", using: :btree
  add_index "light_hangings", ["weather_reading_id"], name: "index_light_hangings_on_weather_reading_id", using: :btree

  create_table "light_references", force: true do |t|
    t.integer  "number"
    t.datetime "datetime"
    t.float    "measurement"
    t.float    "photons"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "light_string_measurements", force: true do |t|
    t.integer  "light_hanging_id"
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

  add_index "light_string_measurements", ["light_hanging_id"], name: "index_light_string_measurements_on_light_hanging_id", using: :btree

  create_table "litterfall_traps", force: true do |t|
    t.integer "plot_id",                 null: false
    t.string  "litterfall_trap_num",     null: false
    t.float   "litterfall_trap_size_m2", null: false
  end

  add_index "litterfall_traps", ["plot_id", "litterfall_trap_num"], name: "index_litterfall_traps_on_plot_id_and_litterfall_trap_num", unique: true, using: :btree
  add_index "litterfall_traps", ["plot_id"], name: "index_litterfall_traps_on_plot_id", using: :btree

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

  add_index "people", ["person_name"], name: "index_people_on_person_name", unique: true, using: :btree

  create_table "people_roles", force: true do |t|
    t.integer  "person_id",  null: false
    t.integer  "plot_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people_roles", ["person_id"], name: "index_people_roles_on_person_id", using: :btree
  add_index "people_roles", ["plot_id"], name: "index_people_roles_on_plot_id", using: :btree

  create_table "phosphorus_curves", force: true do |t|
    t.float    "first_standard_0"
    t.float    "second_standard_0"
    t.float    "absorbance_0"
    t.float    "concentration_0"
    t.float    "first_standard_2"
    t.float    "second_standard_2"
    t.float    "absorbance_2"
    t.float    "concentration_2"
    t.float    "first_standard_4"
    t.float    "second_standard_4"
    t.float    "absorbance_4"
    t.float    "concentration_4"
    t.float    "first_standard_8"
    t.float    "second_standard_8"
    t.float    "absorbance_8"
    t.float    "concentration_8"
    t.float    "first_standard_12"
    t.float    "second_standard_12"
    t.float    "absorbance_12"
    t.float    "concentration_12"
    t.float    "first_standard_16"
    t.float    "second_standard_16"
    t.float    "absorbance_16"
    t.float    "concentration_16"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phosphorus_measurements", force: true do |t|
    t.integer  "leaf_id"
    t.integer  "phosphorus_curve_id"
    t.string   "rack"
    t.integer  "row"
    t.string   "column"
    t.integer  "sample_mass"
    t.float    "sample_absorbance"
    t.float    "sample_concentration"
    t.float    "sample_volume"
    t.float    "p_mass"
    t.float    "p_original"
    t.float    "corrected_std"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phosphorus_measurements", ["leaf_id"], name: "index_phosphorus_measurements_on_leaf_id", using: :btree
  add_index "phosphorus_measurements", ["phosphorus_curve_id"], name: "phosphorus_measurements_phosphorus_curve_id_fk", using: :btree

  create_table "photosynthesis_measurements", force: true do |t|
    t.integer  "leaf_id"
    t.integer  "file_number"
    t.string   "code"
    t.integer  "order"
    t.float    "photosynthesis"
    t.float    "photosynthesis_std"
    t.float    "conductance"
    t.float    "conductance_std"
    t.float    "internal_co2"
    t.float    "transpiration"
    t.float    "vpd"
    t.float    "area"
    t.float    "air_temp"
    t.float    "leaf_temp"
    t.float    "block_temp"
    t.float    "co2_reference"
    t.float    "co2_sample"
    t.float    "water_reference"
    t.float    "water_sample"
    t.float    "rh_reference"
    t.float    "rh_sample"
    t.float    "flow"
    t.float    "par_in"
    t.float    "par_out"
    t.float    "pressure"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photosynthesis_measurements", ["leaf_id"], name: "index_photosynthesis_measurements_on_leaf_id", using: :btree

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

  add_index "plots", ["plot_code"], name: "index_plots_on_plot_code", unique: true, using: :btree
  add_index "plots", ["site_id"], name: "index_plots_on_site_id", using: :btree

  create_table "region_countries", force: true do |t|
    t.integer  "region_id",           null: false
    t.integer  "country_id",          null: false
    t.string   "region_country_code", null: false
    t.string   "region_country_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "region_countries", ["country_id"], name: "index_region_countries_on_country_id", using: :btree
  add_index "region_countries", ["region_country_code"], name: "index_region_countries_on_region_country_code", unique: true, using: :btree
  add_index "region_countries", ["region_id"], name: "index_region_countries_on_region_id", using: :btree

  create_table "regions", force: true do |t|
    t.integer  "global_region_id", null: false
    t.string   "region_code",      null: false
    t.string   "region_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "regions", ["global_region_id"], name: "index_regions_on_global_region_id", using: :btree
  add_index "regions", ["region_code"], name: "index_regions_on_region_code", unique: true, using: :btree

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

  add_index "sites", ["region_country_id"], name: "index_sites_on_region_country_id", using: :btree
  add_index "sites", ["site_code"], name: "index_sites_on_site_code", unique: true, using: :btree

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

  add_index "small_stem_values", ["tree_id"], name: "index_small_stem_values_on_tree_id", using: :btree

  create_table "soil_respiration_tubes", force: true do |t|
    t.integer  "plot_id",          null: false
    t.string   "tube_code",        null: false
    t.string   "plot_corner_code", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "soil_respiration_tubes", ["plot_id", "tube_code", "plot_corner_code"], name: "index_soil_respiration_tubes_on_plot_and_tube_info", unique: true, using: :btree
  add_index "soil_respiration_tubes", ["plot_id"], name: "index_soil_respiration_tubes_on_plot_id", using: :btree

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

  add_index "soil_respiration_values", ["soil_respiration_tube_id"], name: "index_soil_respiration_values_on_soil_respiration_tube_id", using: :btree

  create_table "spectra_measurements", force: true do |t|
    t.integer  "leaf_id"
    t.string   "code"
    t.string   "comments"
    t.string   "branch"
    t.string   "order"
    t.string   "type"
    t.float    "measurement-350"
    t.float    "measurement-351"
    t.float    "measurement-352"
    t.float    "measurement-353"
    t.float    "measurement-354"
    t.float    "measurement-355"
    t.float    "measurement-356"
    t.float    "measurement-357"
    t.float    "measurement-358"
    t.float    "measurement-359"
    t.float    "measurement-360"
    t.float    "measurement-361"
    t.float    "measurement-362"
    t.float    "measurement-363"
    t.float    "measurement-364"
    t.float    "measurement-365"
    t.float    "measurement-366"
    t.float    "measurement-367"
    t.float    "measurement-368"
    t.float    "measurement-369"
    t.float    "measurement-370"
    t.float    "measurement-371"
    t.float    "measurement-372"
    t.float    "measurement-373"
    t.float    "measurement-374"
    t.float    "measurement-375"
    t.float    "measurement-376"
    t.float    "measurement-377"
    t.float    "measurement-378"
    t.float    "measurement-379"
    t.float    "measurement-380"
    t.float    "measurement-381"
    t.float    "measurement-382"
    t.float    "measurement-383"
    t.float    "measurement-384"
    t.float    "measurement-385"
    t.float    "measurement-386"
    t.float    "measurement-387"
    t.float    "measurement-388"
    t.float    "measurement-389"
    t.float    "measurement-390"
    t.float    "measurement-391"
    t.float    "measurement-392"
    t.float    "measurement-393"
    t.float    "measurement-394"
    t.float    "measurement-395"
    t.float    "measurement-396"
    t.float    "measurement-397"
    t.float    "measurement-398"
    t.float    "measurement-399"
    t.float    "measurement-400"
    t.float    "measurement-401"
    t.float    "measurement-402"
    t.float    "measurement-403"
    t.float    "measurement-404"
    t.float    "measurement-405"
    t.float    "measurement-406"
    t.float    "measurement-407"
    t.float    "measurement-408"
    t.float    "measurement-409"
    t.float    "measurement-410"
    t.float    "measurement-411"
    t.float    "measurement-412"
    t.float    "measurement-413"
    t.float    "measurement-414"
    t.float    "measurement-415"
    t.float    "measurement-416"
    t.float    "measurement-417"
    t.float    "measurement-418"
    t.float    "measurement-419"
    t.float    "measurement-420"
    t.float    "measurement-421"
    t.float    "measurement-422"
    t.float    "measurement-423"
    t.float    "measurement-424"
    t.float    "measurement-425"
    t.float    "measurement-426"
    t.float    "measurement-427"
    t.float    "measurement-428"
    t.float    "measurement-429"
    t.float    "measurement-430"
    t.float    "measurement-431"
    t.float    "measurement-432"
    t.float    "measurement-433"
    t.float    "measurement-434"
    t.float    "measurement-435"
    t.float    "measurement-436"
    t.float    "measurement-437"
    t.float    "measurement-438"
    t.float    "measurement-439"
    t.float    "measurement-440"
    t.float    "measurement-441"
    t.float    "measurement-442"
    t.float    "measurement-443"
    t.float    "measurement-444"
    t.float    "measurement-445"
    t.float    "measurement-446"
    t.float    "measurement-447"
    t.float    "measurement-448"
    t.float    "measurement-449"
    t.float    "measurement-450"
    t.float    "measurement-451"
    t.float    "measurement-452"
    t.float    "measurement-453"
    t.float    "measurement-454"
    t.float    "measurement-455"
    t.float    "measurement-456"
    t.float    "measurement-457"
    t.float    "measurement-458"
    t.float    "measurement-459"
    t.float    "measurement-460"
    t.float    "measurement-461"
    t.float    "measurement-462"
    t.float    "measurement-463"
    t.float    "measurement-464"
    t.float    "measurement-465"
    t.float    "measurement-466"
    t.float    "measurement-467"
    t.float    "measurement-468"
    t.float    "measurement-469"
    t.float    "measurement-470"
    t.float    "measurement-471"
    t.float    "measurement-472"
    t.float    "measurement-473"
    t.float    "measurement-474"
    t.float    "measurement-475"
    t.float    "measurement-476"
    t.float    "measurement-477"
    t.float    "measurement-478"
    t.float    "measurement-479"
    t.float    "measurement-480"
    t.float    "measurement-481"
    t.float    "measurement-482"
    t.float    "measurement-483"
    t.float    "measurement-484"
    t.float    "measurement-485"
    t.float    "measurement-486"
    t.float    "measurement-487"
    t.float    "measurement-488"
    t.float    "measurement-489"
    t.float    "measurement-490"
    t.float    "measurement-491"
    t.float    "measurement-492"
    t.float    "measurement-493"
    t.float    "measurement-494"
    t.float    "measurement-495"
    t.float    "measurement-496"
    t.float    "measurement-497"
    t.float    "measurement-498"
    t.float    "measurement-499"
    t.float    "measurement-500"
    t.float    "measurement-501"
    t.float    "measurement-502"
    t.float    "measurement-503"
    t.float    "measurement-504"
    t.float    "measurement-505"
    t.float    "measurement-506"
    t.float    "measurement-507"
    t.float    "measurement-508"
    t.float    "measurement-509"
    t.float    "measurement-510"
    t.float    "measurement-511"
    t.float    "measurement-512"
    t.float    "measurement-513"
    t.float    "measurement-514"
    t.float    "measurement-515"
    t.float    "measurement-516"
    t.float    "measurement-517"
    t.float    "measurement-518"
    t.float    "measurement-519"
    t.float    "measurement-520"
    t.float    "measurement-521"
    t.float    "measurement-522"
    t.float    "measurement-523"
    t.float    "measurement-524"
    t.float    "measurement-525"
    t.float    "measurement-526"
    t.float    "measurement-527"
    t.float    "measurement-528"
    t.float    "measurement-529"
    t.float    "measurement-530"
    t.float    "measurement-531"
    t.float    "measurement-532"
    t.float    "measurement-533"
    t.float    "measurement-534"
    t.float    "measurement-535"
    t.float    "measurement-536"
    t.float    "measurement-537"
    t.float    "measurement-538"
    t.float    "measurement-539"
    t.float    "measurement-540"
    t.float    "measurement-541"
    t.float    "measurement-542"
    t.float    "measurement-543"
    t.float    "measurement-544"
    t.float    "measurement-545"
    t.float    "measurement-546"
    t.float    "measurement-547"
    t.float    "measurement-548"
    t.float    "measurement-549"
    t.float    "measurement-550"
    t.float    "measurement-551"
    t.float    "measurement-552"
    t.float    "measurement-553"
    t.float    "measurement-554"
    t.float    "measurement-555"
    t.float    "measurement-556"
    t.float    "measurement-557"
    t.float    "measurement-558"
    t.float    "measurement-559"
    t.float    "measurement-560"
    t.float    "measurement-561"
    t.float    "measurement-562"
    t.float    "measurement-563"
    t.float    "measurement-564"
    t.float    "measurement-565"
    t.float    "measurement-566"
    t.float    "measurement-567"
    t.float    "measurement-568"
    t.float    "measurement-569"
    t.float    "measurement-570"
    t.float    "measurement-571"
    t.float    "measurement-572"
    t.float    "measurement-573"
    t.float    "measurement-574"
    t.float    "measurement-575"
    t.float    "measurement-576"
    t.float    "measurement-577"
    t.float    "measurement-578"
    t.float    "measurement-579"
    t.float    "measurement-580"
    t.float    "measurement-581"
    t.float    "measurement-582"
    t.float    "measurement-583"
    t.float    "measurement-584"
    t.float    "measurement-585"
    t.float    "measurement-586"
    t.float    "measurement-587"
    t.float    "measurement-588"
    t.float    "measurement-589"
    t.float    "measurement-590"
    t.float    "measurement-591"
    t.float    "measurement-592"
    t.float    "measurement-593"
    t.float    "measurement-594"
    t.float    "measurement-595"
    t.float    "measurement-596"
    t.float    "measurement-597"
    t.float    "measurement-598"
    t.float    "measurement-599"
    t.float    "measurement-600"
    t.float    "measurement-601"
    t.float    "measurement-602"
    t.float    "measurement-603"
    t.float    "measurement-604"
    t.float    "measurement-605"
    t.float    "measurement-606"
    t.float    "measurement-607"
    t.float    "measurement-608"
    t.float    "measurement-609"
    t.float    "measurement-610"
    t.float    "measurement-611"
    t.float    "measurement-612"
    t.float    "measurement-613"
    t.float    "measurement-614"
    t.float    "measurement-615"
    t.float    "measurement-616"
    t.float    "measurement-617"
    t.float    "measurement-618"
    t.float    "measurement-619"
    t.float    "measurement-620"
    t.float    "measurement-621"
    t.float    "measurement-622"
    t.float    "measurement-623"
    t.float    "measurement-624"
    t.float    "measurement-625"
    t.float    "measurement-626"
    t.float    "measurement-627"
    t.float    "measurement-628"
    t.float    "measurement-629"
    t.float    "measurement-630"
    t.float    "measurement-631"
    t.float    "measurement-632"
    t.float    "measurement-633"
    t.float    "measurement-634"
    t.float    "measurement-635"
    t.float    "measurement-636"
    t.float    "measurement-637"
    t.float    "measurement-638"
    t.float    "measurement-639"
    t.float    "measurement-640"
    t.float    "measurement-641"
    t.float    "measurement-642"
    t.float    "measurement-643"
    t.float    "measurement-644"
    t.float    "measurement-645"
    t.float    "measurement-646"
    t.float    "measurement-647"
    t.float    "measurement-648"
    t.float    "measurement-649"
    t.float    "measurement-650"
    t.float    "measurement-651"
    t.float    "measurement-652"
    t.float    "measurement-653"
    t.float    "measurement-654"
    t.float    "measurement-655"
    t.float    "measurement-656"
    t.float    "measurement-657"
    t.float    "measurement-658"
    t.float    "measurement-659"
    t.float    "measurement-660"
    t.float    "measurement-661"
    t.float    "measurement-662"
    t.float    "measurement-663"
    t.float    "measurement-664"
    t.float    "measurement-665"
    t.float    "measurement-666"
    t.float    "measurement-667"
    t.float    "measurement-668"
    t.float    "measurement-669"
    t.float    "measurement-670"
    t.float    "measurement-671"
    t.float    "measurement-672"
    t.float    "measurement-673"
    t.float    "measurement-674"
    t.float    "measurement-675"
    t.float    "measurement-676"
    t.float    "measurement-677"
    t.float    "measurement-678"
    t.float    "measurement-679"
    t.float    "measurement-680"
    t.float    "measurement-681"
    t.float    "measurement-682"
    t.float    "measurement-683"
    t.float    "measurement-684"
    t.float    "measurement-685"
    t.float    "measurement-686"
    t.float    "measurement-687"
    t.float    "measurement-688"
    t.float    "measurement-689"
    t.float    "measurement-690"
    t.float    "measurement-691"
    t.float    "measurement-692"
    t.float    "measurement-693"
    t.float    "measurement-694"
    t.float    "measurement-695"
    t.float    "measurement-696"
    t.float    "measurement-697"
    t.float    "measurement-698"
    t.float    "measurement-699"
    t.float    "measurement-700"
    t.float    "measurement-701"
    t.float    "measurement-702"
    t.float    "measurement-703"
    t.float    "measurement-704"
    t.float    "measurement-705"
    t.float    "measurement-706"
    t.float    "measurement-707"
    t.float    "measurement-708"
    t.float    "measurement-709"
    t.float    "measurement-710"
    t.float    "measurement-711"
    t.float    "measurement-712"
    t.float    "measurement-713"
    t.float    "measurement-714"
    t.float    "measurement-715"
    t.float    "measurement-716"
    t.float    "measurement-717"
    t.float    "measurement-718"
    t.float    "measurement-719"
    t.float    "measurement-720"
    t.float    "measurement-721"
    t.float    "measurement-722"
    t.float    "measurement-723"
    t.float    "measurement-724"
    t.float    "measurement-725"
    t.float    "measurement-726"
    t.float    "measurement-727"
    t.float    "measurement-728"
    t.float    "measurement-729"
    t.float    "measurement-730"
    t.float    "measurement-731"
    t.float    "measurement-732"
    t.float    "measurement-733"
    t.float    "measurement-734"
    t.float    "measurement-735"
    t.float    "measurement-736"
    t.float    "measurement-737"
    t.float    "measurement-738"
    t.float    "measurement-739"
    t.float    "measurement-740"
    t.float    "measurement-741"
    t.float    "measurement-742"
    t.float    "measurement-743"
    t.float    "measurement-744"
    t.float    "measurement-745"
    t.float    "measurement-746"
    t.float    "measurement-747"
    t.float    "measurement-748"
    t.float    "measurement-749"
    t.float    "measurement-750"
    t.float    "measurement-751"
    t.float    "measurement-752"
    t.float    "measurement-753"
    t.float    "measurement-754"
    t.float    "measurement-755"
    t.float    "measurement-756"
    t.float    "measurement-757"
    t.float    "measurement-758"
    t.float    "measurement-759"
    t.float    "measurement-760"
    t.float    "measurement-761"
    t.float    "measurement-762"
    t.float    "measurement-763"
    t.float    "measurement-764"
    t.float    "measurement-765"
    t.float    "measurement-766"
    t.float    "measurement-767"
    t.float    "measurement-768"
    t.float    "measurement-769"
    t.float    "measurement-770"
    t.float    "measurement-771"
    t.float    "measurement-772"
    t.float    "measurement-773"
    t.float    "measurement-774"
    t.float    "measurement-775"
    t.float    "measurement-776"
    t.float    "measurement-777"
    t.float    "measurement-778"
    t.float    "measurement-779"
    t.float    "measurement-780"
    t.float    "measurement-781"
    t.float    "measurement-782"
    t.float    "measurement-783"
    t.float    "measurement-784"
    t.float    "measurement-785"
    t.float    "measurement-786"
    t.float    "measurement-787"
    t.float    "measurement-788"
    t.float    "measurement-789"
    t.float    "measurement-790"
    t.float    "measurement-791"
    t.float    "measurement-792"
    t.float    "measurement-793"
    t.float    "measurement-794"
    t.float    "measurement-795"
    t.float    "measurement-796"
    t.float    "measurement-797"
    t.float    "measurement-798"
    t.float    "measurement-799"
    t.float    "measurement-800"
    t.float    "measurement-801"
    t.float    "measurement-802"
    t.float    "measurement-803"
    t.float    "measurement-804"
    t.float    "measurement-805"
    t.float    "measurement-806"
    t.float    "measurement-807"
    t.float    "measurement-808"
    t.float    "measurement-809"
    t.float    "measurement-810"
    t.float    "measurement-811"
    t.float    "measurement-812"
    t.float    "measurement-813"
    t.float    "measurement-814"
    t.float    "measurement-815"
    t.float    "measurement-816"
    t.float    "measurement-817"
    t.float    "measurement-818"
    t.float    "measurement-819"
    t.float    "measurement-820"
    t.float    "measurement-821"
    t.float    "measurement-822"
    t.float    "measurement-823"
    t.float    "measurement-824"
    t.float    "measurement-825"
    t.float    "measurement-826"
    t.float    "measurement-827"
    t.float    "measurement-828"
    t.float    "measurement-829"
    t.float    "measurement-830"
    t.float    "measurement-831"
    t.float    "measurement-832"
    t.float    "measurement-833"
    t.float    "measurement-834"
    t.float    "measurement-835"
    t.float    "measurement-836"
    t.float    "measurement-837"
    t.float    "measurement-838"
    t.float    "measurement-839"
    t.float    "measurement-840"
    t.float    "measurement-841"
    t.float    "measurement-842"
    t.float    "measurement-843"
    t.float    "measurement-844"
    t.float    "measurement-845"
    t.float    "measurement-846"
    t.float    "measurement-847"
    t.float    "measurement-848"
    t.float    "measurement-849"
    t.float    "measurement-850"
    t.float    "measurement-851"
    t.float    "measurement-852"
    t.float    "measurement-853"
    t.float    "measurement-854"
    t.float    "measurement-855"
    t.float    "measurement-856"
    t.float    "measurement-857"
    t.float    "measurement-858"
    t.float    "measurement-859"
    t.float    "measurement-860"
    t.float    "measurement-861"
    t.float    "measurement-862"
    t.float    "measurement-863"
    t.float    "measurement-864"
    t.float    "measurement-865"
    t.float    "measurement-866"
    t.float    "measurement-867"
    t.float    "measurement-868"
    t.float    "measurement-869"
    t.float    "measurement-870"
    t.float    "measurement-871"
    t.float    "measurement-872"
    t.float    "measurement-873"
    t.float    "measurement-874"
    t.float    "measurement-875"
    t.float    "measurement-876"
    t.float    "measurement-877"
    t.float    "measurement-878"
    t.float    "measurement-879"
    t.float    "measurement-880"
    t.float    "measurement-881"
    t.float    "measurement-882"
    t.float    "measurement-883"
    t.float    "measurement-884"
    t.float    "measurement-885"
    t.float    "measurement-886"
    t.float    "measurement-887"
    t.float    "measurement-888"
    t.float    "measurement-889"
    t.float    "measurement-890"
    t.float    "measurement-891"
    t.float    "measurement-892"
    t.float    "measurement-893"
    t.float    "measurement-894"
    t.float    "measurement-895"
    t.float    "measurement-896"
    t.float    "measurement-897"
    t.float    "measurement-898"
    t.float    "measurement-899"
    t.float    "measurement-900"
    t.float    "measurement-901"
    t.float    "measurement-902"
    t.float    "measurement-903"
    t.float    "measurement-904"
    t.float    "measurement-905"
    t.float    "measurement-906"
    t.float    "measurement-907"
    t.float    "measurement-908"
    t.float    "measurement-909"
    t.float    "measurement-910"
    t.float    "measurement-911"
    t.float    "measurement-912"
    t.float    "measurement-913"
    t.float    "measurement-914"
    t.float    "measurement-915"
    t.float    "measurement-916"
    t.float    "measurement-917"
    t.float    "measurement-918"
    t.float    "measurement-919"
    t.float    "measurement-920"
    t.float    "measurement-921"
    t.float    "measurement-922"
    t.float    "measurement-923"
    t.float    "measurement-924"
    t.float    "measurement-925"
    t.float    "measurement-926"
    t.float    "measurement-927"
    t.float    "measurement-928"
    t.float    "measurement-929"
    t.float    "measurement-930"
    t.float    "measurement-931"
    t.float    "measurement-932"
    t.float    "measurement-933"
    t.float    "measurement-934"
    t.float    "measurement-935"
    t.float    "measurement-936"
    t.float    "measurement-937"
    t.float    "measurement-938"
    t.float    "measurement-939"
    t.float    "measurement-940"
    t.float    "measurement-941"
    t.float    "measurement-942"
    t.float    "measurement-943"
    t.float    "measurement-944"
    t.float    "measurement-945"
    t.float    "measurement-946"
    t.float    "measurement-947"
    t.float    "measurement-948"
    t.float    "measurement-949"
    t.float    "measurement-950"
    t.float    "measurement-951"
    t.float    "measurement-952"
    t.float    "measurement-953"
    t.float    "measurement-954"
    t.float    "measurement-955"
    t.float    "measurement-956"
    t.float    "measurement-957"
    t.float    "measurement-958"
    t.float    "measurement-959"
    t.float    "measurement-960"
    t.float    "measurement-961"
    t.float    "measurement-962"
    t.float    "measurement-963"
    t.float    "measurement-964"
    t.float    "measurement-965"
    t.float    "measurement-966"
    t.float    "measurement-967"
    t.float    "measurement-968"
    t.float    "measurement-969"
    t.float    "measurement-970"
    t.float    "measurement-971"
    t.float    "measurement-972"
    t.float    "measurement-973"
    t.float    "measurement-974"
    t.float    "measurement-975"
    t.float    "measurement-976"
    t.float    "measurement-977"
    t.float    "measurement-978"
    t.float    "measurement-979"
    t.float    "measurement-980"
    t.float    "measurement-981"
    t.float    "measurement-982"
    t.float    "measurement-983"
    t.float    "measurement-984"
    t.float    "measurement-985"
    t.float    "measurement-986"
    t.float    "measurement-987"
    t.float    "measurement-988"
    t.float    "measurement-989"
    t.float    "measurement-990"
    t.float    "measurement-991"
    t.float    "measurement-992"
    t.float    "measurement-993"
    t.float    "measurement-994"
    t.float    "measurement-995"
    t.float    "measurement-996"
    t.float    "measurement-997"
    t.float    "measurement-998"
    t.float    "measurement-999"
    t.float    "measurement-1000"
    t.float    "measurement-1001"
    t.float    "measurement-1002"
    t.float    "measurement-1003"
    t.float    "measurement-1004"
    t.float    "measurement-1005"
    t.float    "measurement-1006"
    t.float    "measurement-1007"
    t.float    "measurement-1008"
    t.float    "measurement-1009"
    t.float    "measurement-1010"
    t.float    "measurement-1011"
    t.float    "measurement-1012"
    t.float    "measurement-1013"
    t.float    "measurement-1014"
    t.float    "measurement-1015"
    t.float    "measurement-1016"
    t.float    "measurement-1017"
    t.float    "measurement-1018"
    t.float    "measurement-1019"
    t.float    "measurement-1020"
    t.float    "measurement-1021"
    t.float    "measurement-1022"
    t.float    "measurement-1023"
    t.float    "measurement-1024"
    t.float    "measurement-1025"
    t.float    "measurement-1026"
    t.float    "measurement-1027"
    t.float    "measurement-1028"
    t.float    "measurement-1029"
    t.float    "measurement-1030"
    t.float    "measurement-1031"
    t.float    "measurement-1032"
    t.float    "measurement-1033"
    t.float    "measurement-1034"
    t.float    "measurement-1035"
    t.float    "measurement-1036"
    t.float    "measurement-1037"
    t.float    "measurement-1038"
    t.float    "measurement-1039"
    t.float    "measurement-1040"
    t.float    "measurement-1041"
    t.float    "measurement-1042"
    t.float    "measurement-1043"
    t.float    "measurement-1044"
    t.float    "measurement-1045"
    t.float    "measurement-1046"
    t.float    "measurement-1047"
    t.float    "measurement-1048"
    t.float    "measurement-1049"
    t.float    "measurement-1050"
    t.float    "measurement-1051"
    t.float    "measurement-1052"
    t.float    "measurement-1053"
    t.float    "measurement-1054"
    t.float    "measurement-1055"
    t.float    "measurement-1056"
    t.float    "measurement-1057"
    t.float    "measurement-1058"
    t.float    "measurement-1059"
    t.float    "measurement-1060"
    t.float    "measurement-1061"
    t.float    "measurement-1062"
    t.float    "measurement-1063"
    t.float    "measurement-1064"
    t.float    "measurement-1065"
    t.float    "measurement-1066"
    t.float    "measurement-1067"
    t.float    "measurement-1068"
    t.float    "measurement-1069"
    t.float    "measurement-1070"
    t.float    "measurement-1071"
    t.float    "measurement-1072"
    t.float    "measurement-1073"
    t.float    "measurement-1074"
    t.float    "measurement-1075"
    t.float    "measurement-1076"
    t.float    "measurement-1077"
    t.float    "measurement-1078"
    t.float    "measurement-1079"
    t.float    "measurement-1080"
    t.float    "measurement-1081"
    t.float    "measurement-1082"
    t.float    "measurement-1083"
    t.float    "measurement-1084"
    t.float    "measurement-1085"
    t.float    "measurement-1086"
    t.float    "measurement-1087"
    t.float    "measurement-1088"
    t.float    "measurement-1089"
    t.float    "measurement-1090"
    t.float    "measurement-1091"
    t.float    "measurement-1092"
    t.float    "measurement-1093"
    t.float    "measurement-1094"
    t.float    "measurement-1095"
    t.float    "measurement-1096"
    t.float    "measurement-1097"
    t.float    "measurement-1098"
    t.float    "measurement-1099"
    t.float    "measurement-1100"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spectra_measurements", ["leaf_id"], name: "index_spectra_measurements_on_leaf_id", using: :btree

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

  add_index "stem_respiration_values", ["tree_id"], name: "index_stem_respiration_values_on_tree_id", using: :btree

  create_table "sub_plots", force: true do |t|
    t.integer  "plot_id"
    t.string   "sub_plot_code"
    t.string   "sub_plot_type"
    t.float    "sub_plot_area_m2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_plots", ["plot_id", "sub_plot_code"], name: "index_sub_plots_on_plot_id_and_sub_plot_code", unique: true, using: :btree
  add_index "sub_plots", ["plot_id"], name: "index_sub_plots_on_plot_id", using: :btree

  create_table "toughness_measurements", force: true do |t|
    t.integer  "branch_id", null: false
    t.datetime "date",      null: false
    t.string   "evaluator"
    t.string   "replica"
    t.float    "thickness"
    t.float    "width"
    t.float    "lines"
    t.float    "punch"
  end

  add_index "toughness_measurements", ["branch_id"], name: "index_toughness_measurements_on_branch_id", using: :btree

  create_table "trees", force: true do |t|
    t.integer  "sub_plot_id"
    t.string   "tree_code"
    t.string   "tree_class"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fp_species_id"
    t.integer  "fp_id"
  end

  add_index "trees", ["fp_species_id"], name: "index_trees_on_fp_species_id", using: :btree
  add_index "trees", ["sub_plot_id"], name: "index_trees_on_sub_plot_id", using: :btree

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

  add_index "weather_readings", ["plot_id"], name: "index_weather_readings_on_plot_id", using: :btree

  create_table "wood_densities", force: true do |t|
    t.integer  "branch_id"
    t.datetime "date"
    t.string   "evaluator"
    t.string   "branch_number"
    t.float    "volume"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wood_densities", ["branch_id"], name: "index_wood_densities_on_branch_id", using: :btree

  add_foreign_key "arizonas", "leaves", name: "arizonas_leaf_id_fk"

  add_foreign_key "branch_architectures", "branches", name: "branch_architectures_branch_id_fk"

  add_foreign_key "branch_light_measurements", "branch_light_placements", name: "branch_light_measurements_branch_light_placement_id_fk"

  add_foreign_key "branch_light_placements", "branches", name: "branch_light_placements_branch_id_fk"
  add_foreign_key "branch_light_placements", "weather_readings", name: "branch_light_placements_weather_reading_id_fk"

  add_foreign_key "branches", "trees", name: "branches_tree_id_fk"

  add_foreign_key "censuses", "plots", name: "censuses_plot_id_fk"

  add_foreign_key "cn_measurements", "cn_curves", name: "cn_measurements_cn_curve_id_fk"
  add_foreign_key "cn_measurements", "leaves", name: "cn_measurements_leaf_id_fk"

  add_foreign_key "cnp_measurements", "leaves", name: "cnp_measurements_leaf_id_fk"

  add_foreign_key "coarse_woody_debris_values", "cwd_sub_transects", name: "coarse_woody_debris_values_cwd_sub_transect_id_fk"

  add_foreign_key "cwd_sub_transects", "cwd_transects", name: "cwd_sub_transects_cwd_transect_id_fk"

  add_foreign_key "cwd_transects", "plots", name: "cwd_transects_plot_id_fk"

  add_foreign_key "dbh_measurements", "censuses", name: "dbh_measurements_census_id_fk"
  add_foreign_key "dbh_measurements", "trees", name: "dbh_measurements_tree_id_fk"

  add_foreign_key "dendrometer_values", "trees", name: "dendrometer_values_tree_id_fk"

  add_foreign_key "fine_litterfall_values", "litterfall_traps", name: "fine_litterfall_values_litterfall_trap_id_fk"

  add_foreign_key "fp_genera", "fp_families", name: "fp_genera_fp_family_id_fk"

  add_foreign_key "fp_species", "fp_genera", name: "fp_species_fp_genus_id_fk"

  add_foreign_key "ingrowth_core_values", "ingrowth_cores", name: "ingrowth_core_values_ingrowth_core_id_fk"

  add_foreign_key "ingrowth_cores", "plots", name: "ingrowth_cores_plot_id_fk"

  add_foreign_key "leaf_area_index_values", "plots", name: "leaf_area_index_values_plot_id_fk"

  add_foreign_key "leaf_respiration_values", "trees", name: "leaf_respiration_values_tree_id_fk"

  add_foreign_key "leaves", "branches", name: "leaves_branch_id_fk"

  add_foreign_key "light_hangings", "trees", name: "light_hangings_tree_id_fk"
  add_foreign_key "light_hangings", "weather_readings", name: "light_hangings_weather_reading_id_fk"

  add_foreign_key "light_string_measurements", "light_hangings", name: "light_string_measurements_light_hanging_id_fk"

  add_foreign_key "litterfall_traps", "plots", name: "litterfall_traps_plot_id_fk"

  add_foreign_key "people_roles", "people", name: "people_roles_person_id_fk"
  add_foreign_key "people_roles", "plots", name: "people_roles_plot_id_fk"

  add_foreign_key "phosphorus_measurements", "leaves", name: "phosphorus_measurements_leaf_id_fk"
  add_foreign_key "phosphorus_measurements", "phosphorus_curves", name: "phosphorus_measurements_phosphorus_curve_id_fk"

  add_foreign_key "photosynthesis_measurements", "leaves", name: "photosynthesis_measurements_leaf_id_fk"

  add_foreign_key "plots", "sites", name: "plots_site_id_fk"

  add_foreign_key "region_countries", "countries", name: "region_countries_country_id_fk"
  add_foreign_key "region_countries", "regions", name: "region_countries_region_id_fk"

  add_foreign_key "regions", "global_regions", name: "regions_global_region_id_fk"

  add_foreign_key "sites", "region_countries", name: "sites_region_country_id_fk"

  add_foreign_key "small_stem_values", "trees", name: "small_stem_values_tree_id_fk"

  add_foreign_key "soil_respiration_tubes", "plots", name: "soil_respiration_tubes_plot_id_fk"

  add_foreign_key "soil_respiration_values", "soil_respiration_tubes", name: "soil_respiration_values_soil_respiration_tube_id_fk"

  add_foreign_key "spectra_measurements", "leaves", name: "spectra_measurements_leaf_id_fk"

  add_foreign_key "stem_respiration_values", "trees", name: "stem_respiration_values_tree_id_fk"

  add_foreign_key "sub_plots", "plots", name: "sub_plots_plot_id_fk"

  add_foreign_key "toughness_measurements", "branches", name: "toughness_measurements_branch_id_fk"

  add_foreign_key "trees", "fp_species", name: "trees_fp_species_id_fk"
  add_foreign_key "trees", "sub_plots", name: "trees_sub_plot_id_fk"

  add_foreign_key "weather_readings", "plots", name: "weather_readings_plot_id_fk"

  add_foreign_key "wood_densities", "branches", name: "wood_densities_branch_id_fk"

end
