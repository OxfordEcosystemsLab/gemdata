class CreateMonthlyAveragesValues < ActiveRecord::Migration

  def change

    create_table :monthly_averages_values do |t|
      t.string :plot_code, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.float :npp_fineroot_mgc_ha_mo
      t.float :npp_fineroot_se
      t.float :npp_woody_mgc_ha_mo
      t.float :npp_woody_se
      t.float :cwd_mgc_ha_mo
      t.float :cwd_se
      t.float :respiration_auto_mgc_ha_mo
      t.float :respiration_auto_se
      t.float :respiration_hetero_mgc_ha_mo
      t.float :respiration_hetero_se
      t.float :respiration_setm_mgc_ha_mo
      t.float :respiration_setm_se
      t.float :lai_units
      t.float :lai_se
      t.float :respiration_leaf_mgc_ha_mo
      t.float :respiration_leaf_se
      t.float :litterfall_total
      t.float :litterfall_total_se
      t.float :litterfall_fruit
      t.float :litterfall_fruit_se
      t.float :litterfall_flower
      t.float :litterfall_flower_se
      t.float :litterfall_reproductive
      t.float :litterfall_reproductive_se
      t.float :litterfall_branch
      t.float :litterfall_branch_se
      t.float :litterfall_leaf
      t.float :litterfall_leaf_se
      t.float :litterfall_other
      t.float :litterfall_other_se
      t.string :quality_code, null: false
      t.string :status, null: false
      t.text :comments
      t.timestamps
    end

  end

end
