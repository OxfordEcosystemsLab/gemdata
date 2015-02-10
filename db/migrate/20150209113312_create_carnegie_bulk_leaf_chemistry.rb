class CreateCarnegieBulkLeafChemistry < ActiveRecord::Migration

  def change
    create_table :carnegie_bulk_leaf_chemistries do |t|

      # we didn't really want this in here
      # but it's come back as an easier to use (than the other options)
      # unique row identifier
      t.string :csp_code, index: true

      t.integer :branch_1, references: :branches, index: true
      t.integer :branch_2, references: :branches, index: true
      t.integer :branch_3, references: :branches, index: true
      
      t.string :flagged
      t.string :reason
      t.date :date_collected
      t.float :n
      t.float :chl_a
      t.float :chl_b
      t.float :carotenoids
      t.float :soluble_c
      t.float :delta_13c
      t.float :water
      t.float :p
      t.float :ca
      t.float :k
      t.float :mg
      t.float :lma
      t.float :c
      t.float :lignin
      t.float :cellulose
      t.float :hemi_cellulose
      t.float :phenols
      t.float :tannins
      t.float :b
      t.float :fe
      t.float :mn
      t.float :zn

      t.timestamps
      t.integer :batch_id
    end
  end

end
