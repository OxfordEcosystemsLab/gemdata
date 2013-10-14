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

ActiveRecord::Schema.define(version: 20131012083222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coarse_woody_debris_values", force: true do |t|
    t.string   "plot_code",                             null: false
    t.integer  "year",                                  null: false
    t.integer  "month",                                 null: false
    t.integer  "day"
    t.string   "transect_num",                          null: false
    t.string   "sub_transect_num"
    t.string   "cwd_num",                               null: false
    t.string   "size_class",                            null: false
    t.float    "diameter_1_cm"
    t.float    "diameter_2_cm"
    t.float    "length_cm"
    t.float    "dry_weight_g"
    t.string   "status",           default: "imported"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dendrometer_values", force: true do |t|
    t.string   "plot_code",                          null: false
    t.string   "sub_plot"
    t.string   "tree_tag",                           null: false
    t.integer  "year",                               null: false
    t.integer  "month",                              null: false
    t.integer  "day"
    t.float    "tree_height_m"
    t.float    "dbh_height_m"
    t.float    "dbh_cm"
    t.string   "status",        default: "imported"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fine_litterfall_values", force: true do |t|
    t.string   "plot_code",                          null: false
    t.integer  "year",                               null: false
    t.integer  "month",                              null: false
    t.integer  "day"
    t.string   "collector_num",                      null: false
    t.float    "leaves_g"
    t.float    "twigs_g"
    t.float    "flowers_g"
    t.float    "fruits_g"
    t.float    "bromeliads_g"
    t.float    "epiphytes_g"
    t.float    "other_g"
    t.float    "palm_leaves_g"
    t.float    "palm_flower_g"
    t.float    "palm_fruit_g"
    t.string   "status",        default: "imported"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingrowth_core_values", force: true do |t|
    t.string   "plot_code",                                       null: false
    t.integer  "year",                                            null: false
    t.integer  "month",                                           null: false
    t.integer  "day"
    t.string   "ingrowth_core_num",                               null: false
    t.integer  "time_step",                                       null: false
    t.float    "ingrowth_core_litterfall_g"
    t.float    "soil_humidity_pcnt"
    t.float    "soil_temperature_c"
    t.float    "ol_under_2mm_g"
    t.float    "ml_under_2mm_g"
    t.string   "status",                     default: "imported"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leaf_area_index_values", force: true do |t|
    t.string   "plot_code",                                           null: false
    t.integer  "year",                                                null: false
    t.integer  "month",                                               null: false
    t.integer  "day"
    t.float    "true_lai"
    t.float    "average_leaf_inclination_angle"
    t.float    "recalculated_lai"
    t.float    "std_dev"
    t.string   "status",                         default: "imported"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leaf_respiration_values", force: true do |t|
    t.string   "plot_code",                       null: false
    t.string   "tree_tag",                        null: false
    t.integer  "year",                            null: false
    t.integer  "month",                           null: false
    t.integer  "day"
    t.float    "correction"
    t.float    "a_sun"
    t.float    "a_shade"
    t.float    "resp_sun"
    t.float    "resp_shade"
    t.string   "status",     default: "imported"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "respiration_control_values", force: true do |t|
    t.string   "plot_code",                             null: false
    t.integer  "year",                                  null: false
    t.integer  "month",                                 null: false
    t.integer  "day"
    t.string   "measurement_code",                      null: false
    t.string   "disturbance_code",                      null: false
    t.float    "co2_ref_ppm"
    t.float    "pressure_mb"
    t.float    "air_temp_c"
    t.float    "depth_cm"
    t.float    "vwc_pcnt"
    t.float    "delta_flux"
    t.string   "status",           default: "imported"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "respiration_partitioning_values", force: true do |t|
    t.string   "plot_code",                             null: false
    t.integer  "year",                                  null: false
    t.integer  "month",                                 null: false
    t.integer  "day"
    t.string   "measurement_code",                      null: false
    t.float    "co2_ref_ppm"
    t.float    "pressure_mb"
    t.float    "air_temp_c"
    t.float    "depth_cm"
    t.float    "vwc_pcnt"
    t.float    "delta_flux"
    t.string   "status",           default: "imported"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "small_stem_values", force: true do |t|
    t.string   "plot_code",                              null: false
    t.string   "sub_plot"
    t.string   "tree_tag",                               null: false
    t.integer  "year",                                   null: false
    t.integer  "month",                                  null: false
    t.integer  "day"
    t.float    "wood_density_g_m2"
    t.float    "tree_height_m"
    t.float    "dbh_height_m"
    t.float    "dbh_cm"
    t.string   "status",            default: "imported"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stem_respiration_values", force: true do |t|
    t.string   "plot_code",                        null: false
    t.string   "sub_plot"
    t.string   "tree_tag",                         null: false
    t.string   "tube_num",                         null: false
    t.integer  "year",                             null: false
    t.integer  "month",                            null: false
    t.integer  "day"
    t.float    "co2_ref_ppm"
    t.float    "pressure_mb"
    t.float    "air_temp_c"
    t.float    "depth_cm"
    t.float    "delta_flux"
    t.string   "status",      default: "imported"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
