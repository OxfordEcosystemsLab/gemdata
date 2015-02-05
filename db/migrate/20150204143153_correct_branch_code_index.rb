class CorrectBranchCodeIndex < ActiveRecord::Migration
  def change
    # This index was originally unique
    # Which resulted in it only being possible to have ONE branch 'B1S'
    # in the entire table
    #
    # see 20140322201843_create_branches.rb
    remove_index :branches, :code
    add_index :branches, [:tree_id, :code], unique: true
  end
end
