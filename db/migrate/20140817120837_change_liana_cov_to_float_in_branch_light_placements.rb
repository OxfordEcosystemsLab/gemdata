class ChangeLianaCovToFloatInBranchLightPlacements < ActiveRecord::Migration
  def change
    remove_column :branch_light_placements, :liana_cov
    add_column    :branch_light_placements, :liana_cov, :float
  end
end
