require 'spec_helper'
require 'csv'
require 'importer'

describe EgmStemRespirationImporter do
  it_behaves_like 'Importer'

  before :each do
    @collar = set_up_egm_respiration_collar('IVI-01', EgmRespirationCollar::Type::STEM)
    @tree = set_up_tree('IVI-01', '11', '1')
  end

  it 'can read CSV' do

    values = CSV.parse_line 'IVI-01,1,11,NA,1,2013,NA,4,26,6,8,10,625,7,14,0.49,960,8,NA,comment'

    importer = EgmStemRespirationImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    o = importer.object.reload

    expect(o.tree).to                   eq(@tree)
    expect(o.egm_respiration_collar).to eq(@collar)
    expect(o.datetime).to eq(Time.parse('Wed, 26 Jun 2013 08:10:00 UTC +00:00'))

    expect(o.replica).to            eq(1)
    expect(o.egm_measurement).to    eq(nil)
    expect(o.recno).to              eq(4.0)
    expect(o.co2ref_ppm).to         eq(625)
    expect(o.inputd).to             eq(7.0)
    expect(o.time).to               eq(14.0)
    expect(o.inputf).to             eq(0.49)
    expect(o.atmp_mb).to            eq(960)
    expect(o.probe_type).to         eq(8)
    expect(o.manually_collected_final_flux_ppm_sec).to eq(nil)

    expect(o.quality_code).to       eq(nil)
    expect(o.comments).to           eq('comment')

    expect(o).to be_valid
  end

end
