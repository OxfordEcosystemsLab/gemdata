class AddBatchIdToImports < ActiveRecord::Migration

  def change
    add_column :branch_architectures, :batch_id, :integer
    add_column :branch_light_measurements, :batch_id, :integer
    add_column :branch_light_placements, :batch_id, :integer
    add_column :branches, :batch_id, :integer
    add_column :censuses, :batch_id, :integer
    add_column :cn_curves, :batch_id, :integer
    add_column :cn_measurements, :batch_id, :integer
    add_column :cnp_measurements, :batch_id, :integer
    add_column :crown_perimeters, :batch_id, :integer
    add_column :dbh_measurements, :batch_id, :integer
    add_column :fp_families, :batch_id, :integer
    add_column :fp_genera, :batch_id, :integer
    add_column :fp_species, :batch_id, :integer
    add_column :hemi_photo_files, :batch_id, :integer
    add_column :hemi_photos, :batch_id, :integer
    add_column :herbivories, :batch_id, :integer
    add_column :leaf_anatomies, :batch_id, :integer
    add_column :leaf_areas, :batch_id, :integer
    add_column :leaf_morphologies, :batch_id, :integer
    add_column :leaf_parts, :batch_id, :integer
    add_column :leaf_repellencies, :batch_id, :integer
    add_column :leaf_venations, :batch_id, :integer
    add_column :leaves, :batch_id, :integer
    add_column :light_hangings, :batch_id, :integer
    add_column :light_references, :batch_id, :integer
    add_column :light_string_measurements, :batch_id, :integer
    add_column :osmometries, :batch_id, :integer
    add_column :phosphorus_curves, :batch_id, :integer
    add_column :phosphorus_measurements, :batch_id, :integer
    add_column :photosynthesis_measurements, :batch_id, :integer
    add_column :plots, :batch_id, :integer
    add_column :specific_leaf_areas, :batch_id, :integer
    add_column :spectra_measurements, :batch_id, :integer
    add_column :sub_plots, :batch_id, :integer
    add_column :toughness_measurements, :batch_id, :integer
    add_column :weather_readings, :batch_id, :integer
    add_column :wood_anatomies, :batch_id, :integer
    add_column :wood_densities, :batch_id, :integer
  end
end
