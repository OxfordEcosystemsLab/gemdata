class AddForestPlotsIdToTree < ActiveRecord::Migration
  def change
    add_column :trees, :fp_id, :integer
  end
end
