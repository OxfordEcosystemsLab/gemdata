require 'spec_helper'
require 'csv'
require 'importer'

describe IngrowthCoreImporter do
  it_behaves_like 'Importer'

  before :each do
    @ingrowth_core = set_up_ingrowth_core('ESP-01', '2')
  end

  it 'can read CSV' do
    values = CSV.parse_line 'ESP-01,2009,5,10,2,n,14.38,18,11.7,1,10,0.09,NaN,1,comment'

    importer = IngrowthCoreImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    o = importer.object.reload

    expect(o.ingrowth_core).to eq(@ingrowth_core)
    expect(o.date).to eq(Date.parse('2009-05-10'))

    expect(o.is_stock_yn).to                eq('n')
    expect(o.ingrowth_core_litterfall_g).to eq(14.38)
    expect(o.soil_humidity_pcnt).to         eq(18)
    expect(o.soil_temperature_c).to         eq(11.7)
    expect(o.time_step).to                  eq(1)
    expect(o.time_step_minutes).to          eq(10)
    expect(o.ol_under_2mm_g).to             eq(0.09)
    expect(o.ml_under_2mm_g).to             be_nil

    expect(o.quality_code).to               eq('1')
    expect(o.comments).to                   eq('comment')

    expect(o).to be_valid
  end

end
