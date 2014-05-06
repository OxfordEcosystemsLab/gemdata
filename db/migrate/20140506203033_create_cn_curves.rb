class CreateCnCurves < ActiveRecord::Migration
  def change
    create_table :cn_curves do |t|
      (1..8).each do |number|
        t.float "c_enr_#{number}"
        t.float "n_enr_#{number}"
        t.float "c_percent_#{number}"
        t.float "n_percent_#{number}"
        t.float "cn_ratio_#{number}"
      end

      t.timestamps
    end
  end
end
