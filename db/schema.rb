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

ActiveRecord::Schema.define(version: 20150220124221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: true do |t|
    t.string   "import_address"
    t.datetime "started"
    t.datetime "finished"
    t.boolean  "transaction_passed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.integer  "batch_id"
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
    t.integer  "batch_id"
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
    t.string   "note"
    t.datetime "start"
    t.datetime "finish"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
    t.float    "angle_pic"
    t.float    "liana_cov"
  end

  add_index "branch_light_placements", ["branch_id"], name: "index_branch_light_placements_on_branch_id", using: :btree
  add_index "branch_light_placements", ["weather_reading_id"], name: "index_branch_light_placements_on_weather_reading_id", using: :btree

  create_table "branches", force: true do |t|
    t.string   "code",       null: false
    t.integer  "tree_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
  end

  add_index "branches", ["tree_id", "code"], name: "index_branches_on_tree_id_and_code", unique: true, using: :btree
  add_index "branches", ["tree_id"], name: "index_branches_on_tree_id", using: :btree

  create_table "carnegie_bulk_leaf_chemistries", force: true do |t|
    t.string   "csp_code"
    t.integer  "branch_1"
    t.integer  "branch_2"
    t.integer  "branch_3"
    t.string   "flagged"
    t.string   "reason"
    t.date     "date_collected"
    t.float    "n"
    t.float    "chl_a"
    t.float    "chl_b"
    t.float    "carotenoids"
    t.float    "soluble_c"
    t.float    "delta_13c"
    t.float    "water"
    t.float    "p"
    t.float    "ca"
    t.float    "k"
    t.float    "mg"
    t.float    "lma"
    t.float    "c"
    t.float    "lignin"
    t.float    "cellulose"
    t.float    "hemi_cellulose"
    t.float    "phenols"
    t.float    "tannins"
    t.float    "b"
    t.float    "fe"
    t.float    "mn"
    t.float    "zn"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
  end

  create_table "censuses", force: true do |t|
    t.integer  "number"
    t.string   "mean_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "plot_id"
    t.integer  "batch_id"
  end

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
    t.integer  "batch_id"
    t.string   "date"
    t.string   "label"
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
    t.integer  "batch_id"
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
    t.integer  "batch_id"
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
    t.integer  "cwd_sub_transect_id", null: false
    t.datetime "date",                null: false
    t.string   "cwd_num",             null: false
    t.string   "size_class"
    t.string   "decay_class"
    t.float    "diameter_1_cm"
    t.float    "diameter_2_cm"
    t.float    "length_cm"
    t.float    "dry_weight_g"
    t.string   "quality_code"
    t.text     "comments"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coarse_woody_debris_values", ["cwd_sub_transect_id", "date", "cwd_num"], name: "index_cwd_values_on_sub_transect_date_and_cwd_num", unique: true, using: :btree
  add_index "coarse_woody_debris_values", ["cwd_sub_transect_id"], name: "index_coarse_woody_debris_values_on_cwd_sub_transect_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "country_code", null: false
    t.string   "country_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crown_dimensions", force: true do |t|
    t.integer  "tree_id"
    t.float    "depth"
    t.float    "width_max"
    t.float    "vol"
    t.integer  "batch_id"
    t.float    "h_tree"
    t.float    "poly_vol"
    t.float    "surf_area"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "crown_dimensions", ["tree_id"], name: "index_crown_dimensions_on_tree_id", using: :btree

  create_table "crown_perimeters", force: true do |t|
    t.integer  "tree_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
    t.datetime "time"
    t.integer  "seq"
    t.string   "sun"
    t.string   "reading_type"
    t.float    "az"
    t.float    "vd"
    t.float    "hd"
    t.string   "note"
    t.float    "x"
    t.float    "y"
    t.float    "z"
  end

  add_index "crown_perimeters", ["tree_id"], name: "index_crown_perimeters_on_tree_id", using: :btree

  create_table "csp_translations", force: true do |t|
    t.string  "csp_code"
    t.string  "genus"
    t.string  "species"
    t.string  "full_name"
    t.string  "family"
    t.string  "taxon_info"
    t.date    "date_collected"
    t.string  "habit"
    t.boolean "sun"
    t.string  "tree_code"
    t.string  "branch_code"
    t.string  "site"
  end

  add_index "csp_translations", ["csp_code"], name: "index_csp_translations_on_csp_code", using: :btree
  add_index "csp_translations", ["tree_code"], name: "index_csp_translations_on_tree_code", using: :btree

  create_table "cwd_sub_transects", force: true do |t|
    t.integer  "cwd_transect_id",          null: false
    t.string   "sub_transect_num",         null: false
    t.float    "sub_transect_area_m2",     null: false
    t.string   "sub_transect_start_point"
    t.string   "sub_transect_end_point"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cwd_sub_transects", ["cwd_transect_id", "sub_transect_num"], name: "index_cwd_sub_transects_on_transect_and_sub_transect", unique: true, using: :btree
  add_index "cwd_sub_transects", ["cwd_transect_id"], name: "index_cwd_sub_transects_on_cwd_transect_id", using: :btree

  create_table "cwd_transects", force: true do |t|
    t.integer  "plot_id",      null: false
    t.string   "transect_num", null: false
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cwd_transects", ["plot_id", "transect_num"], name: "index_cwd_transects_on_plot_id_and_transect_num", unique: true, using: :btree
  add_index "cwd_transects", ["plot_id"], name: "index_cwd_transects_on_plot_id", using: :btree

  create_table "dbh_measurements", force: true do |t|
    t.integer  "tree_id"
    t.integer  "census_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
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

  create_table "egm_respiration_collars", force: true do |t|
    t.integer  "plot_id",          null: false
    t.integer  "sub_plot_id"
    t.integer  "tree_id"
    t.string   "collar_num"
    t.string   "plot_corner_code"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "egm_respiration_collars", ["plot_id"], name: "index_egm_respiration_collars_on_plot_id", using: :btree
  add_index "egm_respiration_collars", ["sub_plot_id"], name: "index_egm_respiration_collars_on_sub_plot_id", using: :btree
  add_index "egm_respiration_collars", ["tree_id"], name: "index_egm_respiration_collars_on_tree_id", using: :btree

  create_table "egm_respiration_values", force: true do |t|
    t.integer  "egm_respiration_collar_id"
    t.integer  "ingrowth_core_id"
    t.datetime "datetime",                  null: false
    t.string   "measurement_code",          null: false
    t.string   "treatment_code"
    t.string   "litter_code"
    t.string   "disturbance_code"
    t.integer  "replica"
    t.float    "egm_measurement"
    t.float    "recno"
    t.float    "co2ref_ppm"
    t.float    "inputd"
    t.float    "time"
    t.float    "inputf"
    t.float    "atmp_mb"
    t.float    "probe_type"
    t.string   "quality_code"
    t.text     "comments"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "egm_respiration_values", ["egm_respiration_collar_id"], name: "index_egm_respiration_values_on_egm_respiration_collar_id", using: :btree
  add_index "egm_respiration_values", ["ingrowth_core_id"], name: "index_egm_respiration_values_on_ingrowth_core_id", using: :btree

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
    t.integer  "litterfall_trap_id",    null: false
    t.datetime "collection_date",       null: false
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
    t.string   "quality_code"
    t.text     "comments"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fine_litterfall_values", ["litterfall_trap_id"], name: "index_fine_litterfall_values_on_litterfall_trap_id", using: :btree

  create_table "fp_families", force: true do |t|
    t.integer  "apg_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
  end

  create_table "fp_genera", force: true do |t|
    t.integer  "fp_family_id"
    t.integer  "fp_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
  end

  add_index "fp_genera", ["fp_family_id"], name: "index_fp_genera_on_fp_family_id", using: :btree

  create_table "fp_species", force: true do |t|
    t.integer  "fp_genus_id"
    t.integer  "fp_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
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

  create_table "hemi_photo_files", force: true do |t|
    t.integer  "hemi_photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
  end

  add_index "hemi_photo_files", ["hemi_photo_id"], name: "index_hemi_photo_files_on_hemi_photo_id", using: :btree

  create_table "hemi_photos", force: true do |t|
    t.integer  "tree_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
  end

  add_index "hemi_photos", ["tree_id"], name: "index_hemi_photos_on_tree_id", using: :btree

  create_table "herbivories", force: true do |t|
    t.integer  "branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
  end

  add_index "herbivories", ["branch_id"], name: "index_herbivories_on_branch_id", using: :btree

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
    t.datetime "date",                       null: false
    t.string   "is_stock_yn",                null: false
    t.float    "ingrowth_core_litterfall_g"
    t.float    "soil_humidity_pcnt"
    t.float    "soil_temperature_c"
    t.integer  "time_step",                  null: false
    t.integer  "time_step_minutes",          null: false
    t.float    "ol_under_2mm_g"
    t.float    "ml_under_2mm_g"
    t.string   "quality_code"
    t.text     "comments"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingrowth_core_values", ["ingrowth_core_id"], name: "index_ingrowth_core_values_on_ingrowth_core_id", using: :btree

  create_table "ingrowth_cores", force: true do |t|
    t.integer  "plot_id",           null: false
    t.string   "ingrowth_core_num", null: false
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingrowth_cores", ["plot_id", "ingrowth_core_num"], name: "index_ingrowth_cores_on_plot_id_and_ingrowth_core_num", unique: true, using: :btree
  add_index "ingrowth_cores", ["plot_id"], name: "index_ingrowth_cores_on_plot_id", using: :btree

  create_table "large_tree_dendrometer_readings", force: true do |t|
    t.integer  "tree_id",                         null: false
    t.datetime "date",                            null: false
    t.float    "pom_height_m"
    t.float    "dendrometer_reading_mm",          null: false
    t.float    "dendrometer_reading_replaced_mm"
    t.string   "status_code"
    t.string   "mortality_code"
    t.string   "quality_code"
    t.text     "comments"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "large_tree_dendrometer_readings", ["tree_id"], name: "index_large_tree_dendrometer_readings_on_tree_id", using: :btree

  create_table "leaf_anatomies", force: true do |t|
    t.integer  "leaf_part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
  end

  add_index "leaf_anatomies", ["leaf_part_id"], name: "index_leaf_anatomies_on_leaf_part_id", using: :btree

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

  create_table "leaf_areas", force: true do |t|
    t.integer  "leaf_part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
    t.date     "date"
    t.string   "person"
    t.float    "area"
  end

  add_index "leaf_areas", ["leaf_part_id"], name: "index_leaf_areas_on_leaf_part_id", using: :btree

  create_table "leaf_part_characteristics", force: true do |t|
    t.integer  "leaf_part_id"
    t.string   "evaluators"
    t.string   "original_code"
    t.float    "fresh_mass"
    t.float    "dry_mass"
    t.float    "thickness"
    t.float    "petiole_width"
    t.float    "dry_mass_corrected"
    t.string   "quality_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
    t.date     "date"
    t.string   "comments"
  end

  add_index "leaf_part_characteristics", ["batch_id"], name: "index_leaf_part_characteristics_on_batch_id", using: :btree

  create_table "leaf_part_translations", force: true do |t|
    t.string   "ar_class"
    t.string   "original_suffix"
    t.string   "part"
    t.integer  "subsection"
    t.string   "simple_or_compound"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
  end

  add_index "leaf_part_translations", ["original_suffix"], name: "index_leaf_part_translations_on_original_suffix", using: :btree

  create_table "leaf_parts", force: true do |t|
    t.integer  "leaf_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
    t.string   "code"
  end

  add_index "leaf_parts", ["code"], name: "index_leaf_parts_on_code", using: :btree
  add_index "leaf_parts", ["leaf_id"], name: "index_leaf_parts_on_leaf_id", using: :btree

  create_table "leaf_repellencies", force: true do |t|
    t.integer  "branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
    t.string   "replica"
    t.integer  "photo_number"
    t.string   "angle_exclude"
    t.string   "angle_comments"
    t.float    "angle"
  end

  add_index "leaf_repellencies", ["branch_id"], name: "index_leaf_repellencies_on_branch_id", using: :btree

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

  create_table "leaf_venations", force: true do |t|
    t.integer  "leaf_part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
    t.string   "census_comparable_branch_code"
    t.string   "image_enhanced"
    t.string   "image_traced"
    t.string   "image_veins_fitted"
    t.string   "image_areoles_fitted"
    t.string   "image_data_vertex_list"
    t.string   "image_data_edge_list"
    t.string   "image_data_edge_perims"
    t.string   "image_data_edge_radii"
    t.boolean  "vein_image_good"
    t.float    "vein_area_analyzed"
    t.float    "vein_density"
    t.float    "vein_length_mean"
    t.float    "vein_length_sd"
    t.float    "vein_tortuosity_mean"
    t.float    "vein_tortuosity_sd"
    t.float    "vein_minimum_spanning_tree_ratio"
    t.float    "vein_areole_elongation_ratio_mean"
    t.float    "vein_areole_elongation_ratio_sd"
    t.float    "vein_areole_roughness_mean"
    t.float    "vein_areole_roughness_sd"
    t.float    "vein_areole_loopiness"
    t.float    "vein_freely_ending_veinlet_ratio"
    t.float    "vein_area_fraction"
    t.float    "vein_thickness_mean_weighted"
    t.float    "vein_thickness_sd_weighted"
  end

  add_index "leaf_venations", ["census_comparable_branch_code"], name: "index_leaf_venations_on_census_comparable_branch_code", using: :btree
  add_index "leaf_venations", ["leaf_part_id"], name: "index_leaf_venations_on_leaf_part_id", using: :btree

  create_table "leaves", force: true do |t|
    t.integer  "branch_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
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
    t.datetime "finish"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
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
    t.integer  "plot_id"
    t.integer  "batch_id"
  end

  add_index "light_references", ["datetime"], name: "index_light_references_on_datetime", using: :btree

  create_table "light_string_measurements", force: true do |t|
    t.integer  "light_hanging_id"
    t.datetime "datetime"
    t.integer  "record_no"
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
    t.integer  "batch_id"
    t.float    "m20"
  end

  add_index "light_string_measurements", ["light_hanging_id"], name: "index_light_string_measurements_on_light_hanging_id", using: :btree

  create_table "litterfall_traps", force: true do |t|
    t.integer  "plot_id",                 null: false
    t.string   "litterfall_trap_num",     null: false
    t.float    "litterfall_trap_size_m2", null: false
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "osmometries", force: true do |t|
    t.datetime "date"
    t.float    "temperature"
    t.float    "humidity"
    t.string   "disk_orientation"
    t.integer  "branch_id"
    t.float    "m1"
    t.float    "m2"
    t.float    "m3"
    t.float    "m4"
    t.float    "m5"
    t.float    "m6"
    t.float    "m7"
    t.float    "m8"
    t.float    "m9"
    t.float    "m10"
    t.string   "observations"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "osmometries", ["branch_id"], name: "index_osmometries_on_branch_id", using: :btree

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
    t.integer  "batch_id"
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
    t.integer  "batch_id"
  end

  add_index "phosphorus_measurements", ["leaf_id"], name: "index_phosphorus_measurements_on_leaf_id", using: :btree

  create_table "photosynthesis_measurements", force: true do |t|
    t.text     "filename"
    t.string   "code"
    t.integer  "area_corr"
    t.float    "photosynthesis"
    t.float    "photosynthesis_std"
    t.float    "conductance"
    t.float    "conductance_std"
    t.float    "internal_co2"
    t.float    "transpiration"
    t.float    "vpd"
    t.float    "air_temp"
    t.float    "leaf_temp"
    t.float    "co2_reference"
    t.float    "co2_sample"
    t.float    "water_reference"
    t.float    "water_sample"
    t.float    "rh_reference"
    t.float    "rh_sample"
    t.float    "par_in"
    t.float    "pressure"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
    t.string   "pm_type"
    t.date     "date"
    t.time     "time"
    t.integer  "leaf_part_id"
  end

  add_index "photosynthesis_measurements", ["leaf_part_id"], name: "index_photosynthesis_measurements_on_leaf_part_id", using: :btree

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
    t.integer  "batch_id"
  end

  add_index "plots", ["plot_code", "fp_id"], name: "index_plots_on_plot_code_and_fp_id", unique: true, using: :btree
  add_index "plots", ["plot_code"], name: "index_plots_on_plot_code", using: :btree
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

  create_table "small_tree_dendrometer_readings", force: true do |t|
    t.integer  "tree_id",           null: false
    t.datetime "date",              null: false
    t.float    "wood_density_g_m2"
    t.float    "tree_height_m"
    t.float    "pom_height_m"
    t.float    "dbh_northsouth_cm"
    t.float    "dbh_westeast_cm"
    t.string   "rainfor_flag1"
    t.string   "rainfor_flag2"
    t.string   "rainfor_flag3"
    t.string   "quality_code"
    t.text     "comments"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "small_tree_dendrometer_readings", ["tree_id"], name: "index_small_tree_dendrometer_readings_on_tree_id", using: :btree

  create_table "specific_leaf_areas", force: true do |t|
    t.integer  "leaf_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
  end

  add_index "specific_leaf_areas", ["leaf_id"], name: "index_specific_leaf_areas_on_leaf_id", using: :btree

  create_table "spectra_measurements", force: true do |t|
    t.string   "comments"
    t.string   "type"
    t.float    "measurement_350"
    t.float    "measurement_351"
    t.float    "measurement_352"
    t.float    "measurement_353"
    t.float    "measurement_354"
    t.float    "measurement_355"
    t.float    "measurement_356"
    t.float    "measurement_357"
    t.float    "measurement_358"
    t.float    "measurement_359"
    t.float    "measurement_360"
    t.float    "measurement_361"
    t.float    "measurement_362"
    t.float    "measurement_363"
    t.float    "measurement_364"
    t.float    "measurement_365"
    t.float    "measurement_366"
    t.float    "measurement_367"
    t.float    "measurement_368"
    t.float    "measurement_369"
    t.float    "measurement_370"
    t.float    "measurement_371"
    t.float    "measurement_372"
    t.float    "measurement_373"
    t.float    "measurement_374"
    t.float    "measurement_375"
    t.float    "measurement_376"
    t.float    "measurement_377"
    t.float    "measurement_378"
    t.float    "measurement_379"
    t.float    "measurement_380"
    t.float    "measurement_381"
    t.float    "measurement_382"
    t.float    "measurement_383"
    t.float    "measurement_384"
    t.float    "measurement_385"
    t.float    "measurement_386"
    t.float    "measurement_387"
    t.float    "measurement_388"
    t.float    "measurement_389"
    t.float    "measurement_390"
    t.float    "measurement_391"
    t.float    "measurement_392"
    t.float    "measurement_393"
    t.float    "measurement_394"
    t.float    "measurement_395"
    t.float    "measurement_396"
    t.float    "measurement_397"
    t.float    "measurement_398"
    t.float    "measurement_399"
    t.float    "measurement_400"
    t.float    "measurement_401"
    t.float    "measurement_402"
    t.float    "measurement_403"
    t.float    "measurement_404"
    t.float    "measurement_405"
    t.float    "measurement_406"
    t.float    "measurement_407"
    t.float    "measurement_408"
    t.float    "measurement_409"
    t.float    "measurement_410"
    t.float    "measurement_411"
    t.float    "measurement_412"
    t.float    "measurement_413"
    t.float    "measurement_414"
    t.float    "measurement_415"
    t.float    "measurement_416"
    t.float    "measurement_417"
    t.float    "measurement_418"
    t.float    "measurement_419"
    t.float    "measurement_420"
    t.float    "measurement_421"
    t.float    "measurement_422"
    t.float    "measurement_423"
    t.float    "measurement_424"
    t.float    "measurement_425"
    t.float    "measurement_426"
    t.float    "measurement_427"
    t.float    "measurement_428"
    t.float    "measurement_429"
    t.float    "measurement_430"
    t.float    "measurement_431"
    t.float    "measurement_432"
    t.float    "measurement_433"
    t.float    "measurement_434"
    t.float    "measurement_435"
    t.float    "measurement_436"
    t.float    "measurement_437"
    t.float    "measurement_438"
    t.float    "measurement_439"
    t.float    "measurement_440"
    t.float    "measurement_441"
    t.float    "measurement_442"
    t.float    "measurement_443"
    t.float    "measurement_444"
    t.float    "measurement_445"
    t.float    "measurement_446"
    t.float    "measurement_447"
    t.float    "measurement_448"
    t.float    "measurement_449"
    t.float    "measurement_450"
    t.float    "measurement_451"
    t.float    "measurement_452"
    t.float    "measurement_453"
    t.float    "measurement_454"
    t.float    "measurement_455"
    t.float    "measurement_456"
    t.float    "measurement_457"
    t.float    "measurement_458"
    t.float    "measurement_459"
    t.float    "measurement_460"
    t.float    "measurement_461"
    t.float    "measurement_462"
    t.float    "measurement_463"
    t.float    "measurement_464"
    t.float    "measurement_465"
    t.float    "measurement_466"
    t.float    "measurement_467"
    t.float    "measurement_468"
    t.float    "measurement_469"
    t.float    "measurement_470"
    t.float    "measurement_471"
    t.float    "measurement_472"
    t.float    "measurement_473"
    t.float    "measurement_474"
    t.float    "measurement_475"
    t.float    "measurement_476"
    t.float    "measurement_477"
    t.float    "measurement_478"
    t.float    "measurement_479"
    t.float    "measurement_480"
    t.float    "measurement_481"
    t.float    "measurement_482"
    t.float    "measurement_483"
    t.float    "measurement_484"
    t.float    "measurement_485"
    t.float    "measurement_486"
    t.float    "measurement_487"
    t.float    "measurement_488"
    t.float    "measurement_489"
    t.float    "measurement_490"
    t.float    "measurement_491"
    t.float    "measurement_492"
    t.float    "measurement_493"
    t.float    "measurement_494"
    t.float    "measurement_495"
    t.float    "measurement_496"
    t.float    "measurement_497"
    t.float    "measurement_498"
    t.float    "measurement_499"
    t.float    "measurement_500"
    t.float    "measurement_501"
    t.float    "measurement_502"
    t.float    "measurement_503"
    t.float    "measurement_504"
    t.float    "measurement_505"
    t.float    "measurement_506"
    t.float    "measurement_507"
    t.float    "measurement_508"
    t.float    "measurement_509"
    t.float    "measurement_510"
    t.float    "measurement_511"
    t.float    "measurement_512"
    t.float    "measurement_513"
    t.float    "measurement_514"
    t.float    "measurement_515"
    t.float    "measurement_516"
    t.float    "measurement_517"
    t.float    "measurement_518"
    t.float    "measurement_519"
    t.float    "measurement_520"
    t.float    "measurement_521"
    t.float    "measurement_522"
    t.float    "measurement_523"
    t.float    "measurement_524"
    t.float    "measurement_525"
    t.float    "measurement_526"
    t.float    "measurement_527"
    t.float    "measurement_528"
    t.float    "measurement_529"
    t.float    "measurement_530"
    t.float    "measurement_531"
    t.float    "measurement_532"
    t.float    "measurement_533"
    t.float    "measurement_534"
    t.float    "measurement_535"
    t.float    "measurement_536"
    t.float    "measurement_537"
    t.float    "measurement_538"
    t.float    "measurement_539"
    t.float    "measurement_540"
    t.float    "measurement_541"
    t.float    "measurement_542"
    t.float    "measurement_543"
    t.float    "measurement_544"
    t.float    "measurement_545"
    t.float    "measurement_546"
    t.float    "measurement_547"
    t.float    "measurement_548"
    t.float    "measurement_549"
    t.float    "measurement_550"
    t.float    "measurement_551"
    t.float    "measurement_552"
    t.float    "measurement_553"
    t.float    "measurement_554"
    t.float    "measurement_555"
    t.float    "measurement_556"
    t.float    "measurement_557"
    t.float    "measurement_558"
    t.float    "measurement_559"
    t.float    "measurement_560"
    t.float    "measurement_561"
    t.float    "measurement_562"
    t.float    "measurement_563"
    t.float    "measurement_564"
    t.float    "measurement_565"
    t.float    "measurement_566"
    t.float    "measurement_567"
    t.float    "measurement_568"
    t.float    "measurement_569"
    t.float    "measurement_570"
    t.float    "measurement_571"
    t.float    "measurement_572"
    t.float    "measurement_573"
    t.float    "measurement_574"
    t.float    "measurement_575"
    t.float    "measurement_576"
    t.float    "measurement_577"
    t.float    "measurement_578"
    t.float    "measurement_579"
    t.float    "measurement_580"
    t.float    "measurement_581"
    t.float    "measurement_582"
    t.float    "measurement_583"
    t.float    "measurement_584"
    t.float    "measurement_585"
    t.float    "measurement_586"
    t.float    "measurement_587"
    t.float    "measurement_588"
    t.float    "measurement_589"
    t.float    "measurement_590"
    t.float    "measurement_591"
    t.float    "measurement_592"
    t.float    "measurement_593"
    t.float    "measurement_594"
    t.float    "measurement_595"
    t.float    "measurement_596"
    t.float    "measurement_597"
    t.float    "measurement_598"
    t.float    "measurement_599"
    t.float    "measurement_600"
    t.float    "measurement_601"
    t.float    "measurement_602"
    t.float    "measurement_603"
    t.float    "measurement_604"
    t.float    "measurement_605"
    t.float    "measurement_606"
    t.float    "measurement_607"
    t.float    "measurement_608"
    t.float    "measurement_609"
    t.float    "measurement_610"
    t.float    "measurement_611"
    t.float    "measurement_612"
    t.float    "measurement_613"
    t.float    "measurement_614"
    t.float    "measurement_615"
    t.float    "measurement_616"
    t.float    "measurement_617"
    t.float    "measurement_618"
    t.float    "measurement_619"
    t.float    "measurement_620"
    t.float    "measurement_621"
    t.float    "measurement_622"
    t.float    "measurement_623"
    t.float    "measurement_624"
    t.float    "measurement_625"
    t.float    "measurement_626"
    t.float    "measurement_627"
    t.float    "measurement_628"
    t.float    "measurement_629"
    t.float    "measurement_630"
    t.float    "measurement_631"
    t.float    "measurement_632"
    t.float    "measurement_633"
    t.float    "measurement_634"
    t.float    "measurement_635"
    t.float    "measurement_636"
    t.float    "measurement_637"
    t.float    "measurement_638"
    t.float    "measurement_639"
    t.float    "measurement_640"
    t.float    "measurement_641"
    t.float    "measurement_642"
    t.float    "measurement_643"
    t.float    "measurement_644"
    t.float    "measurement_645"
    t.float    "measurement_646"
    t.float    "measurement_647"
    t.float    "measurement_648"
    t.float    "measurement_649"
    t.float    "measurement_650"
    t.float    "measurement_651"
    t.float    "measurement_652"
    t.float    "measurement_653"
    t.float    "measurement_654"
    t.float    "measurement_655"
    t.float    "measurement_656"
    t.float    "measurement_657"
    t.float    "measurement_658"
    t.float    "measurement_659"
    t.float    "measurement_660"
    t.float    "measurement_661"
    t.float    "measurement_662"
    t.float    "measurement_663"
    t.float    "measurement_664"
    t.float    "measurement_665"
    t.float    "measurement_666"
    t.float    "measurement_667"
    t.float    "measurement_668"
    t.float    "measurement_669"
    t.float    "measurement_670"
    t.float    "measurement_671"
    t.float    "measurement_672"
    t.float    "measurement_673"
    t.float    "measurement_674"
    t.float    "measurement_675"
    t.float    "measurement_676"
    t.float    "measurement_677"
    t.float    "measurement_678"
    t.float    "measurement_679"
    t.float    "measurement_680"
    t.float    "measurement_681"
    t.float    "measurement_682"
    t.float    "measurement_683"
    t.float    "measurement_684"
    t.float    "measurement_685"
    t.float    "measurement_686"
    t.float    "measurement_687"
    t.float    "measurement_688"
    t.float    "measurement_689"
    t.float    "measurement_690"
    t.float    "measurement_691"
    t.float    "measurement_692"
    t.float    "measurement_693"
    t.float    "measurement_694"
    t.float    "measurement_695"
    t.float    "measurement_696"
    t.float    "measurement_697"
    t.float    "measurement_698"
    t.float    "measurement_699"
    t.float    "measurement_700"
    t.float    "measurement_701"
    t.float    "measurement_702"
    t.float    "measurement_703"
    t.float    "measurement_704"
    t.float    "measurement_705"
    t.float    "measurement_706"
    t.float    "measurement_707"
    t.float    "measurement_708"
    t.float    "measurement_709"
    t.float    "measurement_710"
    t.float    "measurement_711"
    t.float    "measurement_712"
    t.float    "measurement_713"
    t.float    "measurement_714"
    t.float    "measurement_715"
    t.float    "measurement_716"
    t.float    "measurement_717"
    t.float    "measurement_718"
    t.float    "measurement_719"
    t.float    "measurement_720"
    t.float    "measurement_721"
    t.float    "measurement_722"
    t.float    "measurement_723"
    t.float    "measurement_724"
    t.float    "measurement_725"
    t.float    "measurement_726"
    t.float    "measurement_727"
    t.float    "measurement_728"
    t.float    "measurement_729"
    t.float    "measurement_730"
    t.float    "measurement_731"
    t.float    "measurement_732"
    t.float    "measurement_733"
    t.float    "measurement_734"
    t.float    "measurement_735"
    t.float    "measurement_736"
    t.float    "measurement_737"
    t.float    "measurement_738"
    t.float    "measurement_739"
    t.float    "measurement_740"
    t.float    "measurement_741"
    t.float    "measurement_742"
    t.float    "measurement_743"
    t.float    "measurement_744"
    t.float    "measurement_745"
    t.float    "measurement_746"
    t.float    "measurement_747"
    t.float    "measurement_748"
    t.float    "measurement_749"
    t.float    "measurement_750"
    t.float    "measurement_751"
    t.float    "measurement_752"
    t.float    "measurement_753"
    t.float    "measurement_754"
    t.float    "measurement_755"
    t.float    "measurement_756"
    t.float    "measurement_757"
    t.float    "measurement_758"
    t.float    "measurement_759"
    t.float    "measurement_760"
    t.float    "measurement_761"
    t.float    "measurement_762"
    t.float    "measurement_763"
    t.float    "measurement_764"
    t.float    "measurement_765"
    t.float    "measurement_766"
    t.float    "measurement_767"
    t.float    "measurement_768"
    t.float    "measurement_769"
    t.float    "measurement_770"
    t.float    "measurement_771"
    t.float    "measurement_772"
    t.float    "measurement_773"
    t.float    "measurement_774"
    t.float    "measurement_775"
    t.float    "measurement_776"
    t.float    "measurement_777"
    t.float    "measurement_778"
    t.float    "measurement_779"
    t.float    "measurement_780"
    t.float    "measurement_781"
    t.float    "measurement_782"
    t.float    "measurement_783"
    t.float    "measurement_784"
    t.float    "measurement_785"
    t.float    "measurement_786"
    t.float    "measurement_787"
    t.float    "measurement_788"
    t.float    "measurement_789"
    t.float    "measurement_790"
    t.float    "measurement_791"
    t.float    "measurement_792"
    t.float    "measurement_793"
    t.float    "measurement_794"
    t.float    "measurement_795"
    t.float    "measurement_796"
    t.float    "measurement_797"
    t.float    "measurement_798"
    t.float    "measurement_799"
    t.float    "measurement_800"
    t.float    "measurement_801"
    t.float    "measurement_802"
    t.float    "measurement_803"
    t.float    "measurement_804"
    t.float    "measurement_805"
    t.float    "measurement_806"
    t.float    "measurement_807"
    t.float    "measurement_808"
    t.float    "measurement_809"
    t.float    "measurement_810"
    t.float    "measurement_811"
    t.float    "measurement_812"
    t.float    "measurement_813"
    t.float    "measurement_814"
    t.float    "measurement_815"
    t.float    "measurement_816"
    t.float    "measurement_817"
    t.float    "measurement_818"
    t.float    "measurement_819"
    t.float    "measurement_820"
    t.float    "measurement_821"
    t.float    "measurement_822"
    t.float    "measurement_823"
    t.float    "measurement_824"
    t.float    "measurement_825"
    t.float    "measurement_826"
    t.float    "measurement_827"
    t.float    "measurement_828"
    t.float    "measurement_829"
    t.float    "measurement_830"
    t.float    "measurement_831"
    t.float    "measurement_832"
    t.float    "measurement_833"
    t.float    "measurement_834"
    t.float    "measurement_835"
    t.float    "measurement_836"
    t.float    "measurement_837"
    t.float    "measurement_838"
    t.float    "measurement_839"
    t.float    "measurement_840"
    t.float    "measurement_841"
    t.float    "measurement_842"
    t.float    "measurement_843"
    t.float    "measurement_844"
    t.float    "measurement_845"
    t.float    "measurement_846"
    t.float    "measurement_847"
    t.float    "measurement_848"
    t.float    "measurement_849"
    t.float    "measurement_850"
    t.float    "measurement_851"
    t.float    "measurement_852"
    t.float    "measurement_853"
    t.float    "measurement_854"
    t.float    "measurement_855"
    t.float    "measurement_856"
    t.float    "measurement_857"
    t.float    "measurement_858"
    t.float    "measurement_859"
    t.float    "measurement_860"
    t.float    "measurement_861"
    t.float    "measurement_862"
    t.float    "measurement_863"
    t.float    "measurement_864"
    t.float    "measurement_865"
    t.float    "measurement_866"
    t.float    "measurement_867"
    t.float    "measurement_868"
    t.float    "measurement_869"
    t.float    "measurement_870"
    t.float    "measurement_871"
    t.float    "measurement_872"
    t.float    "measurement_873"
    t.float    "measurement_874"
    t.float    "measurement_875"
    t.float    "measurement_876"
    t.float    "measurement_877"
    t.float    "measurement_878"
    t.float    "measurement_879"
    t.float    "measurement_880"
    t.float    "measurement_881"
    t.float    "measurement_882"
    t.float    "measurement_883"
    t.float    "measurement_884"
    t.float    "measurement_885"
    t.float    "measurement_886"
    t.float    "measurement_887"
    t.float    "measurement_888"
    t.float    "measurement_889"
    t.float    "measurement_890"
    t.float    "measurement_891"
    t.float    "measurement_892"
    t.float    "measurement_893"
    t.float    "measurement_894"
    t.float    "measurement_895"
    t.float    "measurement_896"
    t.float    "measurement_897"
    t.float    "measurement_898"
    t.float    "measurement_899"
    t.float    "measurement_900"
    t.float    "measurement_901"
    t.float    "measurement_902"
    t.float    "measurement_903"
    t.float    "measurement_904"
    t.float    "measurement_905"
    t.float    "measurement_906"
    t.float    "measurement_907"
    t.float    "measurement_908"
    t.float    "measurement_909"
    t.float    "measurement_910"
    t.float    "measurement_911"
    t.float    "measurement_912"
    t.float    "measurement_913"
    t.float    "measurement_914"
    t.float    "measurement_915"
    t.float    "measurement_916"
    t.float    "measurement_917"
    t.float    "measurement_918"
    t.float    "measurement_919"
    t.float    "measurement_920"
    t.float    "measurement_921"
    t.float    "measurement_922"
    t.float    "measurement_923"
    t.float    "measurement_924"
    t.float    "measurement_925"
    t.float    "measurement_926"
    t.float    "measurement_927"
    t.float    "measurement_928"
    t.float    "measurement_929"
    t.float    "measurement_930"
    t.float    "measurement_931"
    t.float    "measurement_932"
    t.float    "measurement_933"
    t.float    "measurement_934"
    t.float    "measurement_935"
    t.float    "measurement_936"
    t.float    "measurement_937"
    t.float    "measurement_938"
    t.float    "measurement_939"
    t.float    "measurement_940"
    t.float    "measurement_941"
    t.float    "measurement_942"
    t.float    "measurement_943"
    t.float    "measurement_944"
    t.float    "measurement_945"
    t.float    "measurement_946"
    t.float    "measurement_947"
    t.float    "measurement_948"
    t.float    "measurement_949"
    t.float    "measurement_950"
    t.float    "measurement_951"
    t.float    "measurement_952"
    t.float    "measurement_953"
    t.float    "measurement_954"
    t.float    "measurement_955"
    t.float    "measurement_956"
    t.float    "measurement_957"
    t.float    "measurement_958"
    t.float    "measurement_959"
    t.float    "measurement_960"
    t.float    "measurement_961"
    t.float    "measurement_962"
    t.float    "measurement_963"
    t.float    "measurement_964"
    t.float    "measurement_965"
    t.float    "measurement_966"
    t.float    "measurement_967"
    t.float    "measurement_968"
    t.float    "measurement_969"
    t.float    "measurement_970"
    t.float    "measurement_971"
    t.float    "measurement_972"
    t.float    "measurement_973"
    t.float    "measurement_974"
    t.float    "measurement_975"
    t.float    "measurement_976"
    t.float    "measurement_977"
    t.float    "measurement_978"
    t.float    "measurement_979"
    t.float    "measurement_980"
    t.float    "measurement_981"
    t.float    "measurement_982"
    t.float    "measurement_983"
    t.float    "measurement_984"
    t.float    "measurement_985"
    t.float    "measurement_986"
    t.float    "measurement_987"
    t.float    "measurement_988"
    t.float    "measurement_989"
    t.float    "measurement_990"
    t.float    "measurement_991"
    t.float    "measurement_992"
    t.float    "measurement_993"
    t.float    "measurement_994"
    t.float    "measurement_995"
    t.float    "measurement_996"
    t.float    "measurement_997"
    t.float    "measurement_998"
    t.float    "measurement_999"
    t.float    "measurement_1000"
    t.float    "measurement_1001"
    t.float    "measurement_1002"
    t.float    "measurement_1003"
    t.float    "measurement_1004"
    t.float    "measurement_1005"
    t.float    "measurement_1006"
    t.float    "measurement_1007"
    t.float    "measurement_1008"
    t.float    "measurement_1009"
    t.float    "measurement_1010"
    t.float    "measurement_1011"
    t.float    "measurement_1012"
    t.float    "measurement_1013"
    t.float    "measurement_1014"
    t.float    "measurement_1015"
    t.float    "measurement_1016"
    t.float    "measurement_1017"
    t.float    "measurement_1018"
    t.float    "measurement_1019"
    t.float    "measurement_1020"
    t.float    "measurement_1021"
    t.float    "measurement_1022"
    t.float    "measurement_1023"
    t.float    "measurement_1024"
    t.float    "measurement_1025"
    t.float    "measurement_1026"
    t.float    "measurement_1027"
    t.float    "measurement_1028"
    t.float    "measurement_1029"
    t.float    "measurement_1030"
    t.float    "measurement_1031"
    t.float    "measurement_1032"
    t.float    "measurement_1033"
    t.float    "measurement_1034"
    t.float    "measurement_1035"
    t.float    "measurement_1036"
    t.float    "measurement_1037"
    t.float    "measurement_1038"
    t.float    "measurement_1039"
    t.float    "measurement_1040"
    t.float    "measurement_1041"
    t.float    "measurement_1042"
    t.float    "measurement_1043"
    t.float    "measurement_1044"
    t.float    "measurement_1045"
    t.float    "measurement_1046"
    t.float    "measurement_1047"
    t.float    "measurement_1048"
    t.float    "measurement_1049"
    t.float    "measurement_1050"
    t.float    "measurement_1051"
    t.float    "measurement_1052"
    t.float    "measurement_1053"
    t.float    "measurement_1054"
    t.float    "measurement_1055"
    t.float    "measurement_1056"
    t.float    "measurement_1057"
    t.float    "measurement_1058"
    t.float    "measurement_1059"
    t.float    "measurement_1060"
    t.float    "measurement_1061"
    t.float    "measurement_1062"
    t.float    "measurement_1063"
    t.float    "measurement_1064"
    t.float    "measurement_1065"
    t.float    "measurement_1066"
    t.float    "measurement_1067"
    t.float    "measurement_1068"
    t.float    "measurement_1069"
    t.float    "measurement_1070"
    t.float    "measurement_1071"
    t.float    "measurement_1072"
    t.float    "measurement_1073"
    t.float    "measurement_1074"
    t.float    "measurement_1075"
    t.float    "measurement_1076"
    t.float    "measurement_1077"
    t.float    "measurement_1078"
    t.float    "measurement_1079"
    t.float    "measurement_1080"
    t.float    "measurement_1081"
    t.float    "measurement_1082"
    t.float    "measurement_1083"
    t.float    "measurement_1084"
    t.float    "measurement_1085"
    t.float    "measurement_1086"
    t.float    "measurement_1087"
    t.float    "measurement_1088"
    t.float    "measurement_1089"
    t.float    "measurement_1090"
    t.float    "measurement_1091"
    t.float    "measurement_1092"
    t.float    "measurement_1093"
    t.float    "measurement_1094"
    t.float    "measurement_1095"
    t.float    "measurement_1096"
    t.float    "measurement_1097"
    t.float    "measurement_1098"
    t.float    "measurement_1099"
    t.float    "measurement_1100"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
    t.integer  "leaf_part_id"
    t.string   "original_code"
    t.integer  "branch_number"
    t.integer  "leaf_number"
    t.integer  "quality_check"
  end

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

  create_table "sub_plots", force: true do |t|
    t.integer  "plot_id"
    t.string   "sub_plot_code"
    t.string   "sub_plot_type"
    t.float    "sub_plot_area_m2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
  end

  add_index "sub_plots", ["plot_id", "sub_plot_code"], name: "index_sub_plots_on_plot_id_and_sub_plot_code", unique: true, using: :btree
  add_index "sub_plots", ["plot_id"], name: "index_sub_plots_on_plot_id", using: :btree

  create_table "toughness_measurements", force: true do |t|
    t.integer  "branch_id",        null: false
    t.datetime "date",             null: false
    t.string   "evaluator"
    t.string   "replica"
    t.float    "thickness"
    t.float    "width"
    t.float    "lines"
    t.float    "punch"
    t.float    "tensile_strength"
    t.integer  "batch_id"
  end

  add_index "toughness_measurements", ["branch_id"], name: "index_toughness_measurements_on_branch_id", using: :btree

  create_table "traits_campaigns", force: true do |t|
    t.integer  "plot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "traits_campaigns", ["plot_id"], name: "index_traits_campaigns_on_plot_id", using: :btree

  create_table "trees", force: true do |t|
    t.integer  "sub_plot_id"
    t.string   "tree_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fp_species_id"
    t.integer  "fp_id"
    t.integer  "batch_id"
    t.boolean  "gem_tree",      default: true
  end

  add_index "trees", ["batch_id"], name: "index_trees_on_batch_id", using: :btree
  add_index "trees", ["fp_species_id"], name: "index_trees_on_fp_species_id", using: :btree
  add_index "trees", ["sub_plot_id"], name: "index_trees_on_sub_plot_id", using: :btree
  add_index "trees", ["tree_code", "sub_plot_id"], name: "index_trees_on_tree_code_and_sub_plot_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

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
    t.integer  "batch_id"
  end

  add_index "weather_readings", ["plot_id"], name: "index_weather_readings_on_plot_id", using: :btree

  create_table "wood_anatomies", force: true do |t|
    t.integer  "branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
  end

  add_index "wood_anatomies", ["branch_id"], name: "index_wood_anatomies_on_branch_id", using: :btree

  create_table "wood_densities", force: true do |t|
    t.integer  "branch_id"
    t.datetime "date"
    t.string   "evaluator"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
    t.string   "original_code"
    t.string   "branch_type"
    t.float    "fresh_volume_cm3"
    t.float    "dry_mass"
    t.float    "density_gcm3"
    t.string   "comment"
  end

  add_index "wood_densities", ["branch_id", "branch_type"], name: "index_wood_densities_on_branch_id_and_branch_type", unique: true, using: :btree
  add_index "wood_densities", ["branch_id"], name: "index_wood_densities_on_branch_id", using: :btree

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

  add_foreign_key "crown_perimeters", "trees", name: "crown_perimeters_tree_id_fk"

  add_foreign_key "cwd_sub_transects", "cwd_transects", name: "cwd_sub_transects_cwd_transect_id_fk"

  add_foreign_key "cwd_transects", "plots", name: "cwd_transects_plot_id_fk"

  add_foreign_key "dbh_measurements", "censuses", name: "dbh_measurements_census_id_fk"
  add_foreign_key "dbh_measurements", "trees", name: "dbh_measurements_tree_id_fk"

  add_foreign_key "egm_respiration_collars", "plots", name: "egm_respiration_collars_plot_id_fk"

  add_foreign_key "egm_respiration_values", "egm_respiration_collars", name: "egm_respiration_values_egm_respiration_collar_id_fk"

  add_foreign_key "fine_litterfall_values", "litterfall_traps", name: "fine_litterfall_values_litterfall_trap_id_fk"

  add_foreign_key "fp_genera", "fp_families", name: "fp_genera_fp_family_id_fk"

  add_foreign_key "fp_species", "fp_genera", name: "fp_species_fp_genus_id_fk"

  add_foreign_key "hemi_photo_files", "hemi_photos", name: "hemi_photo_files_hemi_photo_id_fk"

  add_foreign_key "hemi_photos", "trees", name: "hemi_photos_tree_id_fk"

  add_foreign_key "herbivories", "branches", name: "herbivories_branch_id_fk"

  add_foreign_key "ingrowth_core_values", "ingrowth_cores", name: "ingrowth_core_values_ingrowth_core_id_fk"

  add_foreign_key "ingrowth_cores", "plots", name: "ingrowth_cores_plot_id_fk"

  add_foreign_key "large_tree_dendrometer_readings", "trees", name: "large_tree_dendrometer_readings_tree_id_fk"

  add_foreign_key "leaf_anatomies", "leaf_parts", name: "leaf_anatomies_leaf_part_id_fk"

  add_foreign_key "leaf_area_index_values", "plots", name: "leaf_area_index_values_plot_id_fk"

  add_foreign_key "leaf_areas", "leaf_parts", name: "leaf_areas_leaf_part_id_fk"

  add_foreign_key "leaf_parts", "leaves", name: "leaf_parts_leaf_id_fk"

  add_foreign_key "leaf_repellencies", "branches", name: "leaf_repellencies_branch_id_fk"

  add_foreign_key "leaf_venations", "leaf_parts", name: "leaf_venations_leaf_part_id_fk"

  add_foreign_key "leaves", "branches", name: "leaves_branch_id_fk"

  add_foreign_key "light_hangings", "trees", name: "light_hangings_tree_id_fk"
  add_foreign_key "light_hangings", "weather_readings", name: "light_hangings_weather_reading_id_fk"

  add_foreign_key "light_references", "plots", name: "light_references_plot_id_fk"

  add_foreign_key "light_string_measurements", "light_hangings", name: "light_string_measurements_light_hanging_id_fk"

  add_foreign_key "litterfall_traps", "plots", name: "litterfall_traps_plot_id_fk"

  add_foreign_key "osmometries", "branches", name: "osmometries_branch_id_fk"

  add_foreign_key "people_roles", "people", name: "people_roles_person_id_fk"
  add_foreign_key "people_roles", "plots", name: "people_roles_plot_id_fk"

  add_foreign_key "phosphorus_measurements", "leaves", name: "phosphorus_measurements_leaf_id_fk"
  add_foreign_key "phosphorus_measurements", "phosphorus_curves", name: "phosphorus_measurements_phosphorus_curve_id_fk"

  add_foreign_key "photosynthesis_measurements", "leaf_parts", name: "photosynthesis_measurements_leaf_part_id_fk"

  add_foreign_key "plots", "sites", name: "plots_site_id_fk"

  add_foreign_key "region_countries", "countries", name: "region_countries_country_id_fk"
  add_foreign_key "region_countries", "regions", name: "region_countries_region_id_fk"

  add_foreign_key "regions", "global_regions", name: "regions_global_region_id_fk"

  add_foreign_key "sites", "region_countries", name: "sites_region_country_id_fk"

  add_foreign_key "small_tree_dendrometer_readings", "trees", name: "small_tree_dendrometer_readings_tree_id_fk"

  add_foreign_key "specific_leaf_areas", "leaves", name: "specific_leaf_areas_leaf_id_fk"

  add_foreign_key "spectra_measurements", "leaf_parts", name: "spectra_measurements_leaf_part_id_fk"

  add_foreign_key "sub_plots", "plots", name: "sub_plots_plot_id_fk"

  add_foreign_key "toughness_measurements", "branches", name: "toughness_measurements_branch_id_fk"

  add_foreign_key "traits_campaigns", "plots", name: "traits_campaigns_plot_id_fk"

  add_foreign_key "trees", "fp_species", name: "trees_fp_species_id_fk"
  add_foreign_key "trees", "sub_plots", name: "trees_sub_plot_id_fk"

  add_foreign_key "weather_readings", "plots", name: "weather_readings_plot_id_fk"

  add_foreign_key "wood_anatomies", "branches", name: "wood_anatomies_branch_id_fk"

  add_foreign_key "wood_densities", "branches", name: "wood_densities_branch_id_fk"

end
