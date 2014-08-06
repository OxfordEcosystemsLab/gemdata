require 'spec_helper'
require 'csv'
require 'importer'

describe ToughnessMeasurementImporter do
  it_behaves_like 'Importer'

  before :each do
    @branch = set_up_branch('WAY01', 'CSP28003-78', 'S')
  end

  it 'can read csv' do
    values = CSV.parse_line 'Wayqecha,26/04/2013,Yolvi,WAY01-CSP28003-78-S,L12,0.65,6.97,15.5,4.9,'

    importer = ToughnessMeasurementImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    tm = importer.object
    expect(tm).to be_valid
    expect(tm.branch).to eq(@branch)
    expect(tm.date).to eq(Date.new 2013, 04, 26)
    expect(tm.evaluator).to eq('Yolvi')
    expect(tm.replica).to eq('L12')
    expect(tm.thickness).to eq(0.65)
    expect(tm.width).to eq(6.97)
    expect(tm.lines).to eq(15.5)
    expect(tm.punch).to eq(4.9)
  end

end

