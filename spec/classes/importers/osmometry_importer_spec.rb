require 'spec_helper'
require 'csv'
require 'importer'

describe OsmometryImporter do
  it_behaves_like 'Importer'

  before :each do
    @branch = set_up_branch('PAN-03', 'T213', 'B2S', 1)
  end

  it 'can read CSV' do
    values = CSV.parse_line '10-Feb-10,25.5,64,haz,Qualea paraensis,PAN 03-T213-B2S,569,608,619,626,629,632,635,636,637,639,la muestra no salío se quedo atorado en el osmómetro'
    importer = OsmometryImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    o = importer.object.reload
    expect(o).to be_valid
    expect(o.date).to eq(Date.new 2010, 02, 10)
    expect(o.temperature).to eq(25.5)
    expect(o.humidity).to eq(64)
    expect(o.disk_orientation).to eq('top')
    expect(o.m1).to eq(569)
    expect(o.m2).to eq(608)
    expect(o.m3).to eq(619)
    expect(o.m4).to eq(626)
    expect(o.m5).to eq(629)
    expect(o.m6).to eq(632)
    expect(o.m7).to eq(635)
    expect(o.m8).to eq(636)
    expect(o.m9).to eq(637)
    expect(o.m10).to eq(639)
    expect(o.observations).to eq('la muestra no salío se quedo atorado en el osmómetro')
    expect(o.branch).to eq(@branch)
  end
  
  it 'can translate both orientations' do
    values = CSV.parse_line '11-Feb-10,26.3,61,enves,Qualea paraensis,PAN 03-T213-B2S,725,702,701,704,704,706,708,709,-,-,la lectura se paró en la lectura 8'
    importer = OsmometryImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    o = importer.object.reload
    expect(o).to be_valid
    expect(o.disk_orientation).to eq('bottom')
  end

  it 'understands English too' do
    values = CSV.parse_line '11-Feb-10,26.3,61,bottom,Qualea paraensis,PAN 03-T213-B2S,725,702,701,704,704,706,708,709,-,-,la lectura se paró en la lectura 8'
    importer = OsmometryImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    o = importer.object.reload
    expect(o).to be_valid
    expect(o.disk_orientation).to eq('bottom')
  end

  it 'rejects invalid orientations' do
    values = CSV.parse_line '11-Feb-10,26.3,61,invalid,Qualea paraensis,PAN 03-T213-B2S,725,702,701,704,704,706,708,709,-,-,la lectura se paró en la lectura 8'
    importer = OsmometryImporter.new(1, 2)
    expect{importer.read_row(values, Array.new)}.to raise_error
  end

end
