require 'spec_helper'
require 'csv'
require 'importer'

describe LightReferenceImporter do
  it_behaves_like 'Importer'

  before :each do
    # the current data & importer don't have/do "plot" but they should
    @plot = set_up_plot('ESP-01')
  end

  it 'can read CSV' do
    values = CSV.parse_line '3,1,2013-06-09 06:00:00,0.00183,1.63476096'
    importer = LightReferenceImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    lr = importer.object.reload
    expect(lr.datetime).to eq(Time.parse('2013-06-09 06:00:00'))
    expect(lr.number).to eq(1)
    expect(lr.measurement).to eq(0.00183)
    expect(lr.photons).to eq(1.63476096)
    expect(lr.plot_id).to eq(nil)
  end

  it 'performs validation' do
    values = CSV.parse_line 'garbage,in,garbage,out,said-oscar'
    importer = LightReferenceImporter.new(1, 1)
    expect{importer.read_row(values, Array.new)}.to raise_error
  end
  
end
