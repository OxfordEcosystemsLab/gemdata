require 'spec_helper'
require 'csv'
require 'importer'

describe IngrowthCoreImporter do
  it_behaves_like 'Importer'

  before :each do
    @ingrowth_core = set_up_ingrowth_core('ESP-01', '2')
  end

  it 'can read CSV' do
    values = CSV.parse_line 'ESP-01,2012,7,12,2,n,8.01,24,11.3,0.09,10,1,10,0.6,0,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA'

    importer = IngrowthCoreImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    o = importer.object.reload

    expect(o.ingrowth_core).to eq(@ingrowth_core)
    expect(o.date).to eq(Date.parse('2012-07-12'))

    expect(o.is_stock_yn).to                eq('n')
    expect(o.ingrowth_core_litterfall_g).to eq(8.01)
    expect(o.soil_humidity_pcnt).to         eq(24)
    expect(o.soil_temperature_c).to         eq(11.3)
    expect(o.time_step).to                  eq(1)
    expect(o.time_step_minutes).to          eq(10)
    expect(o.ol_under_2mm_g).to             eq(0.6)
    expect(o.ml_under_2mm_g).to             eq(0)

    expect(o.quality_code).to               be_nil
    expect(o.comments).to                   eq('NA')

    expect(o).to be_valid
  end

end
