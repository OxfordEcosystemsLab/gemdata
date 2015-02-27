require 'spec_helper'
require 'csv'
require 'importer'

describe SpecificLeafAreaImporter do
  it_behaves_like 'Importer'

  it 'can read CSV' do
    leaf = set_up_leaf('ACJ-01', 'T358', 'B11H', 'L1', 1)
    values = CSV.parse_line 'ACJ01-T358-B11H-L1,CSP28237,54.279,0.55,54.279,0.55,no difference between with and without petiole area and mass,c,0.00987,0.00987,101.3274,101.3274'
    importer = SpecificLeafAreaImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    sla = importer.object.reload
    expect(sla.leaf).to eq(leaf)
    expect(sla.lamina_area).to eq(54.279)
    expect(sla.lamina_drymass).to eq(0.55)
    expect(sla.laminapetiole_area).to eq(54.279)
    expect(sla.laminapetiole_drymass).to eq(0.55)
    expect(sla.comment).to eq('no difference between with and without petiole area and mass')
    expect(sla.quality_flag).to eq('c')
    expect(sla.sla_lamina).to eq(0.00987)
    expect(sla.sla_lamina_petiole).to eq(0.00987)
    expect(sla.lma_lamina).to eq(101.3274)
    expect(sla.lma_lamina_petiole).to eq(101.3274)
    expect(sla).to be_valid
  end

  it 'can read the line that Lisa is having problems with' do
    leaf = set_up_leaf('SPD-01', 'T22', 'B11H', 'L1', 1)
    values = CSV.parse_line '"SPD01-T22-B11H-L1","CSP28358","na","na","7.733452275","0.16","SR/A : meaning ?","c","NA","0.0048334077","NA","206.8933696239"'
    importer = SpecificLeafAreaImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
  end

end
