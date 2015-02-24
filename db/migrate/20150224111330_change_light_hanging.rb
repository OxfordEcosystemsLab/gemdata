class ChangeLightHanging < ActiveRecord::Migration
  def change
    change_table 'light_hangings' do |t|
      t.remove :weather_reading_id
    end
  end
end
