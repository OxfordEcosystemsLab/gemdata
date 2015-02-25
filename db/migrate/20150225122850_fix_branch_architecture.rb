class FixBranchArchitecture < ActiveRecord::Migration
  def change
    change_table "branch_architectures" do |t|
      t.remove :date
    end
  end
end
