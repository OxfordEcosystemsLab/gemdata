require 'spec_helper'
require 'csv'
require 'importer'

describe LeafPartCharacteristicsImporter do
  it_behaves_like 'Importer'

  before :each do
    @leaf_part = set_up_leaf_part('ACJ-01', 'T116', 'B11H', 'L1', 'P0S')
  end

  it 'can read CSV' do
    values = CSV.parse_line 'Acjanaco,2013-05-25,Norma Salinas-Rosa Castro,Miconia setulosa,ACJ01-T116-B11H-L1P,ACJ01-T116-B11H-L1P,1.1,0.06,NA,4.9,NA,NA,'
    importer = LeafPartCharacteristicsImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    lc = importer.object.reload
    expect(lc).to be_valid
    expect(lc.leaf_part).to eq(@leaf_part)
    expect(lc.date).to eq(Date.parse('2013-05-25'))
    expect(lc.evaluators).to eq('Norma Salinas-Rosa Castro')
    expect(lc.original_code).to eq('ACJ01-T116-B11H-L1P')
    expect(lc.fresh_mass).to eq(1.1)
    expect(lc.dry_mass).to eq(0.06)
    expect(lc.thickness).to eq(nil)
    expect(lc.petiole_width).to eq(4.9)
    expect(lc.dry_mass_corrected).to eq(nil)
    expect(lc.comments).to eq(nil)
    expect(lc.quality_flag).to eq(nil)
  end
  
end
