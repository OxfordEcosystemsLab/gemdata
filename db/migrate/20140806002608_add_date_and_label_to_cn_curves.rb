class AddDateAndLabelToCnCurves < ActiveRecord::Migration
  def change
    add_column :cn_curves, :date, :string
    add_column :cn_curves, :label, :string
  end
end
