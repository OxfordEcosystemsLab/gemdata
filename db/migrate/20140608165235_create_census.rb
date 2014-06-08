class CreateCensus < ActiveRecord::Migration
  def change
    create_table :censuses do |t|
      t.integer :number
      t.string :mean_date

      t.timestamps
    end
  end
end
