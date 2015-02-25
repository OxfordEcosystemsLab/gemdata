class FixCnp < ActiveRecord::Migration
  def change
    change_table 'cnp_measurements' do |t|
      t.string :c_percent_quality
      t.string :n_percent_quality
      t.string :cn_ration_quality
      t.string :n15_delta_quality
      t.float :c13_delta
      t.string :c13_delta_quality
      t.string :original_cn_leafcode
      t.string :original_P_leafcode
      t.remove :box_number
      t.remove :row
      t.remove :column
      t.remove :n13_delta
      t.remove :p_corrected_avg
      t.remove :p_corrected_var_coef
      t.float :p_corrected_percent
      t.float :p_corrected_percent_cv
      t.string :p_corrected_percent_quality
    end
  end
end
