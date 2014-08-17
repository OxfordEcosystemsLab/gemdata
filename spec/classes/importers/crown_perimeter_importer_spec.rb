require 'spec_helper'
require 'csv'
require 'importer'

describe CrownPerimeterImporter do
  it_behaves_like 'Importer'

  before :each do
    @tree = set_up_tree('WAY01', 'T32')
  end

  it 'can read CSV' do
    values = CSV.parse_line '1,WAY01,1899-12-31 09:30:00,WAY01-T32,1,NA,top,109,11.1,3,NA,-1.731006537,2.45022782,11.1'

    importer = CrownPerimeterImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    cp = importer.object.reload
    expect(cp.tree).to eq(@tree)
    expect(cp.time).to eq(Time.utc(1899, 12, 31, 9, 30, 0))
    expect(cp.seq).to eq(1)
    expect(cp.sun).to be_nil
    expect(cp.reading_type).to eq('top')
    expect(cp.az).to eq(109)
    expect(cp.vd).to eq(11.1)
    expect(cp.hd).to eq(3)
    expect(cp.note).to be_nil
    expect(cp.x).to eq(-1.731006537)
    expect(cp.y).to eq(2.45022782)
    expect(cp.z).to eq(11.1)

    expect(cp).to be_valid
  end

end

