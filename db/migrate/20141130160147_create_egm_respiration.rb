class CreateEgmRespiration < ActiveRecord::Migration
  def change

    create_table :egm_respiration_collars do |t|
      t.references :plot, null: false, index: true
      t.references :sub_plot, index: true
      t.references :tree, index: true
      t.string     :collar_num
      t.string     :plot_corner_code
      t.integer    :batch_id
      t.timestamps
    end
    add_foreign_key :egm_respiration_collars, :plots

    create_table :egm_respiration_values do |t|
      t.references :egm_respiration_collar, index: true
      t.references :ingrowth_core, index: true
      t.datetime   :datetime, null: false
      t.string     :measurement_code, null: false
      t.string     :treatment_code
      t.string     :litter_code
      t.string     :disturbance_code
      t.integer    :replica
      t.float      :egm_measurement
      t.float      :recno
      t.float      :co2ref_ppm
      t.float      :inputd
      t.float      :time
      t.float      :inputf
      t.float      :atmp_mb
      t.float      :probe_type
      t.string     :quality_code
      t.text       :comments
      t.integer    :batch_id
      t.timestamps
    end
    add_foreign_key :egm_respiration_values, :egm_respiration_collars

  end
end
