require 'spec_helper'
require 'csv'
require 'importer'

describe OsmometryImporter do
  it_behaves_like 'Importer'

  before :each do
    @branch = set_up_branch('PAN-03', 'T213', 'B2S', 1)
  end

  it 'can read CSV' do

    values = CSV.parse_line '11-Feb-10,26.3,61,haz,Qualea paraensis,PAN 03-T213-B2S,725,702,701,704,704,706,708,709,-,-,la lectura se paró en la lectura 8'

    importer = OsmometryImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    o = importer.object.reload
    expect(o).to be_valid
    expect(o.date).to eq(Date.new 2010, 02, 11)
    expect(o.temperature).to eq(26.3)
    expect(o.humidity).to eq(61)
    expect(o.disk_orientation).to eq('haz')
    expect(o.m1).to eq(725)
    expect(o.m2).to eq(702)
    expect(o.m3).to eq(701)
    expect(o.m4).to eq(704)
    expect(o.m5).to eq(704)
    expect(o.m6).to eq(706)
    expect(o.m7).to eq(708)
    expect(o.m8).to eq(709)
    expect(o.m9).to be_nil
    expect(o.m10).to be_nil
    expect(o.observations).to eq('la lectura se paró en la lectura 8')
    expect(o.branch).to eq(@branch)
  end

end
