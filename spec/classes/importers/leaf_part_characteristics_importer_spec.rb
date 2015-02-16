require 'spec_helper'
require 'csv'
require 'importer'

describe LeafPartCharacteristicsImporter do
  it_behaves_like 'Importer'

  before :each do
    @leaf = set_up_leaf('WAY-01', 'T1031', 'B1S', 'L3')
  end

  it 'can read CSV' do
    values = CSV.parse_line 'Wayqecha,02/05/2013,Naia Morueta,Brunellia inermis,,WAY01-T1031 -B1S-L3C1,4.61,2.05,0.438,-,'
    importer = LeafPartCharacteristicsImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    lp = importer.object.reload
    expect(lp).to be_valid
    expect(lp.leaf).to eq(@leaf)
    expect(lp.evaluators).to eq('Naia Morueta')
    expect(lp.fresh_mass).to eq(4.61)
    expect(lp.dry_mass).to eq(2.05)
    expect(lp.thickness).to eq(0.438)
    expect(lp.petiole_width).to eq(nil)
    expect(lp.dry_mass_corrected).to eq(nil)
  end
  
end
