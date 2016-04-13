class CreateUscWaxes < ActiveRecord::Migration
  def change
    create_table :usc_waxes do |t|

      t.references :branch, index: true
      t.sun_shade :sun_shade
      t.string :uscname, index: true
      t.float  :weight
      t.interger :d18o_lw
    end
    
    
  end
end
