class UpdatePhotonsPpfd < ActiveRecord::Migration
  def change
    change_table 'light_references' do |t|
      t.remove :photons
      t.float :ppfd
    end
  end
end
