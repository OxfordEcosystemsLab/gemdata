class ChangeLightString < ActiveRecord::Migration
  def change
    change_table 'light_string_measurements' do |t|
      t.remove :light_hanging_id
    end
  end
end
