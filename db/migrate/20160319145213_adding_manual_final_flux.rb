class AddingManualFinalFlux < ActiveRecord::Migration
  def change
    add_column :egm_respiration_values, :manually_collected_final_flux_ppm_sec, :float
  end
end
