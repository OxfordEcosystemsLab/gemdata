class CyclesColumnChanges < ActiveRecord::Migration
  def change

    change_column :large_tree_dendrometer_readings, :dendrometer_reading_mm, :float, null: true

    add_column :small_tree_dendrometer_readings, :dbh_nodirection_cm, :float

    add_column :fine_litterfall_values, :seeds_g_per_trap, :float

    add_column :ingrowth_core_values, :ol_layer_depth_cm, :float
    add_column :ingrowth_core_values, :ml_layer_depth_cm, :float
    add_column :ingrowth_core_values, :ol_2to3_mm_g, :float
    add_column :ingrowth_core_values, :ml_2to3_mm_g, :float
    add_column :ingrowth_core_values, :ol_3to4_mm_g, :float
    add_column :ingrowth_core_values, :ml_3to4_mm_g, :float
    add_column :ingrowth_core_values, :ol_4to5_mm_g, :float
    add_column :ingrowth_core_values, :ml_4to5_mm_g, :float
    add_column :ingrowth_core_values, :ol_above_5mm_g, :float
    add_column :ingrowth_core_values, :ml_above_5mm_g, :float
    
    rename_column :cwd_transects, :transect_num, :cwd_transect_num
    
    rename_column :coarse_woody_debris_values, :diameter_1_cm, :diametertop_1_cm
    rename_column :coarse_woody_debris_values, :diameter_2_cm, :diametertop_2_cm
    
    add_column :coarse_woody_debris_values, :diameterbottom_1_cm, :float
    add_column :coarse_woody_debris_values, :diameterbottom_2_cm, :float

  end
end
