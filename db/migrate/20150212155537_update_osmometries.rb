class UpdateOsmometries < ActiveRecord::Migration
  def change
    change_table :osmometries do |t|
      t.timestamps
    end  
  end
end
