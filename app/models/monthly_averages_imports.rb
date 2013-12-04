class MonthlyAveragesImports < ActiveRecord::Base

  include CSVImportTable

  include ValidatePlotAndDate

  validates :npp_fineroot_mgc_ha_mo,       allow_nil: true, numericality: true
  validates :npp_fineroot_se,              allow_nil: true, numericality: true
  validates :npp_woody_mgc_ha_mo,          allow_nil: true, numericality: true
  validates :npp_woody_se,                 allow_nil: true, numericality: true
  validates :cwd_mgc_ha_mo,                allow_nil: true, numericality: true
  validates :cwd_se,                       allow_nil: true, numericality: true
  validates :respiration_auto_mgc_ha_mo,   allow_nil: true, numericality: true
  validates :respiration_auto_se,          allow_nil: true, numericality: true
  validates :respiration_hetero_mgc_ha_mo, allow_nil: true, numericality: true
  validates :respiration_hetero_se,        allow_nil: true, numericality: true
  validates :respiration_setm_mgc_ha_mo,   allow_nil: true, numericality: true
  validates :respiration_setm_se,          allow_nil: true, numericality: true
  validates :lai_units,                    allow_nil: true, numericality: true
  validates :lai_se,                       allow_nil: true, numericality: true
  validates :respiration_leaf_mgc_ha_mo,   allow_nil: true, numericality: true
  validates :respiration_leaf_se,          allow_nil: true, numericality: true
  validates :litterfall_total,             allow_nil: true, numericality: true
  validates :litterfall_total_se,          allow_nil: true, numericality: true
  validates :litterfall_fruit,             allow_nil: true, numericality: true
  validates :litterfall_fruit_se,          allow_nil: true, numericality: true
  validates :litterfall_flower,            allow_nil: true, numericality: true
  validates :litterfall_flower_se,         allow_nil: true, numericality: true
  validates :litterfall_reproductive,      allow_nil: true, numericality: true
  validates :litterfall_reproductive_se,   allow_nil: true, numericality: true
  validates :litterfall_branch,            allow_nil: true, numericality: true
  validates :litterfall_branch_se,         allow_nil: true, numericality: true
  validates :litterfall_leaf,              allow_nil: true, numericality: true
  validates :litterfall_leaf_se,           allow_nil: true, numericality: true
  validates :litterfall_other,             allow_nil: true, numericality: true
  validates :litterfall_other_se,          allow_nil: true, numericality: true

  def self.unique_key_columns
    [:plot_code, :year, :month]
  end

end
