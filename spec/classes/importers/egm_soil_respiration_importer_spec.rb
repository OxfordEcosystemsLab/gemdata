require 'spec_helper'
require 'csv'
require 'importer'

describe EgmSoilRespirationImporter do
  it_behaves_like 'Importer'

  before :each do
    @egm_respiration_collar = set_up_egm_respiration_collar('IVI-02', EgmRespirationCollar::Type::SOIL)
  end

  it 'can read CSV' do

    values = CSV.parse_line 'IVI-02,25,NA,NA,TOT,NA,NA,NA,1,2015,NA,20,25,7,10,57,492,51,91,0.51,957,8,NA,NA,comment'

    importer = EgmSoilRespirationImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    o = importer.object.reload

    expect(o.egm_respiration_collar).to eq(@egm_respiration_collar)
    expect(o.datetime).to eq(Time.parse('Sat, 25 Jul 2015 10:57:00 UTC +00:00'))

    expect(o.replica).to            eq(1)
    expect(o.egm_measurement).to    eq(nil)
    expect(o.recno).to              eq(20)
    expect(o.co2ref_ppm).to         eq(492)
    expect(o.inputd).to             eq(51)
    expect(o.time).to               eq(91)
    expect(o.inputf).to             eq(0.51)
    expect(o.atmp_mb).to            eq(957)
    expect(o.probe_type).to         eq(8)
    expect(o.manually_collected_final_flux_ppm_sec).to eq(nil)

    expect(o.quality_code).to       eq(nil)
    expect(o.comments).to           eq('comment')

    expect(o).to be_valid
  end

  it 'can cope with NA in date' do
    values = CSV.parse_line 'IVI-02,25,NA,1,TOT,NA,NA,NA,1,2015,1,20,25,7,NA,NA,492,51,91,0.51,957,8,NA,NA,comment'

    importer = EgmSoilRespirationImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    o = importer.object.reload

    expect(o.datetime).to eq(Time.parse('Sat, 25 Jul 2015 00:00:00 UTC +00:00'))
    expect(o).to be_valid
  end

end
