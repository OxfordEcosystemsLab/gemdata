class ChangeRecordColumnName < ActiveRecord::Migration
  def change
    rename_column :light_string_measurements, :record, :record_no
  end
end
