class AddColumnsToSla < ActiveRecord::Migration
  def change
    change_table 'specific_leaf_areas' do |t|
      t.float :lamina_area
      t.float :lamina_drymass
      t.float :laminapetiole_area
      t.float :laminapetiole_drymass
      t.string :comment
      t.string :quality_flag
      t.float :sla_lamina
      t.float :sla_lamina_petiole
      t.float :lma_lamina
      t.float :lma_lamina_petiole
    end
  end
end
