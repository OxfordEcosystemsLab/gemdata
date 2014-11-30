require 'spec_helper'
require 'csv'
require 'importer'

describe EgmRespirationImporter do
  it_behaves_like 'Importer'

  before :each do
    @egm_respiration_collar = set_up_egm_respiration_collar('ESP-01', '1')
  end

  it 'can read CSV' do
    values = CSV.parse_line 'ESP-01,,,,,1,TOT,,,,1,2012,11,5,25,1,14,9,446,10,19,0.44,853,8,1,comment'

    importer = EgmRespirationImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    o = importer.object.reload

    expect(o.egm_respiration_collar).to eq(@egm_respiration_collar)
    expect(o.datetime).to eq(Time.parse('2012-01-25 14:09:00 UTC'))

    expect(o.replica).to            eq(1)
    expect(o.egm_measurement).to    eq(11)
    expect(o.recno).to              eq(5)
    expect(o.co2ref_ppm).to         eq(446)
    expect(o.inputd).to             eq(10)
    expect(o.time).to               eq(19)
    expect(o.inputf).to             eq(0.44)
    expect(o.atmp_mb).to            eq(853)
    expect(o.probe_type).to         eq(8)

    expect(o.quality_code).to       eq('1')
    expect(o.comments).to           eq('comment')

    expect(o).to be_valid
  end

end
