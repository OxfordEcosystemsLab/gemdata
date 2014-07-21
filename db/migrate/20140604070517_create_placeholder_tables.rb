class CreatePlaceholderTables < ActiveRecord::Migration
  def change

    create_table :leaf_parts do |t|
      t.references :leaf, index: true
      t.timestamps
    end

    add_foreign_key :leaf_parts, :leaves

    create_table :wood_anatomies do |t|
      t.references :branch, index: true
      t.timestamps
    end

    add_foreign_key :wood_anatomies, :branches

    create_table :herbivories do |t|
      t.references :branch, index: true
      t.timestamps
    end

    add_foreign_key :herbivories, :branches

    create_table :leaf_anatomies do |t|
      t.references :leaf_part, index: true
      t.timestamps
    end

    add_foreign_key :leaf_anatomies, :leaf_parts

    create_table :leaf_venations do |t|
      t.references :leaf_part, index: true
      t.timestamps
    end

    add_foreign_key :leaf_venations, :leaf_parts

    create_table :crown_perimeters do |t|
      t.references :tree, index: true
      t.timestamps
    end

    add_foreign_key :crown_perimeters, :trees

    create_table :hemi_photos do |t|
      t.references :tree, index: true
      t.timestamps
    end

    add_foreign_key :hemi_photos, :trees

    create_table :hemi_photo_files do |t|
      t.references :hemi_photo, index: true
      t.timestamps
    end

    add_foreign_key :hemi_photo_files, :hemi_photos

    create_table :specific_leaf_areas do |t|
      t.references :leaf, index: true
      t.timestamps
    end

    add_foreign_key :specific_leaf_areas, :leaves

    create_table :leaf_areas do |t|
      t.references :leaf_part, index: true
      t.timestamps
    end

    add_foreign_key :leaf_areas, :leaf_parts

    create_table :leaf_repellencies do |t|
      t.references :branch, index: true
      t.timestamps
    end

    add_foreign_key :leaf_repellencies, :branches

    create_table :traits_campaigns do |t|
      t.references :plot, index: true
      t.timestamps
    end

    add_foreign_key :traits_campaigns, :plots

  end
end
