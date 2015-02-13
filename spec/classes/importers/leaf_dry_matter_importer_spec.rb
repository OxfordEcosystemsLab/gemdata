require 'spec_helper'
require 'csv'
require 'importer'

describe LeafDryMatterImporter do
  it_behaves_like 'Importer'

  before :each do
    @leaf_part = set_up_leaf_part('WAY-01', 'T975', 'B1S', 'L5', 'P')
  end

  it 'can read CSV' do
    values = CSV.parse_line 'Wayqecha,02/05/2013,Naia Morueta,Weinmannia crassifolia,WAY01-T975 -B1S-L5P,1.0,,-,2.29,No se encontró la muestra en el sobre.'
    importer = LeafDryMatterImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    dm = importer.object.reload
    expect(dm).to be_valid
    expect(dm.leaf_part).to eq(@leaf_part)
    expect(dm.date).to eq(Date.new 2013, 05, 02)
    expect(dm.evaluators).to eq('Naia Morueta')
    expect(dm.fresh_mass).to eq(1.0)
    expect(dm.dry_mass).to eq(nil)
    expect(dm.thickness).to eq(nil)
    expect(dm.petiole_width).to eq(2.29)
    expect(dm.comments).to eq('No se encontró la muestra en el sobre.')
  end
  
end
