require 'spec_helper'
require 'csv'
require 'importer'

describe LightReferenceImporter do
  it_behaves_like 'Importer'

  before :each do
    @plot = set_up_plot('ACJ-01')
  end

  it 'can read CSV' do
    values = CSV.parse_line '"3",1,2013-05-21 08:00:00,"ACJ01",1.00305,896.0366016'
    importer = LightReferenceImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    lr = importer.object.reload
    expect(lr.plot).to eq(@plot)
    expect(lr.datetime).to eq(Time.parse('2013-05-21 08:00:00'))
    expect(lr.number).to eq(1)
    expect(lr.measurement).to eq(1.00305)
    expect(lr.photons).to eq(896.0366016)
  end

  it 'performs validation' do
    values = CSV.parse_line 'garbage,in,garbage,out,said,oscar'
    importer = LightReferenceImporter.new(1, 1)
    expect{importer.read_row(values, Array.new)}.to raise_error
  end
  
end
