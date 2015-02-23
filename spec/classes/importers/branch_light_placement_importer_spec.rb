require 'spec_helper'
require 'csv'
require 'importer'

describe BranchLightPlacementImporter do
  it_behaves_like 'Importer'

  it 'can read CSV' do
    @branch = set_up_branch('ESP-01', 'T506', 'B1S')
    values = CSV.parse_line '159,ESP01,ESP01-T506-B1S,266,10.1,1.9,10.6,NA,NA,NA,5/15/2013 8:19,5/15/2013 8:19,NA,NA,NA,T,17.85815535,242.686071,0.073585415,NA,NA,NA,NA,Luz radiante con sol directo,'
    importer = BranchLightPlacementImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    @blp = importer.object.reload
    expect(@blp.branch).to eq(@branch)
    expect(@blp.az_branch).to eq(266)
    expect(@blp.vd_branch).to eq(10.1)
    expect(@blp.hd_branch).to eq(1.9)
    expect(@blp.vground_branch).to eq(10.6)
    expect(@blp.light_cond).to eq(nil)
    expect(@blp.liana_cov).to eq(nil)
    expect(@blp.note).to eq(nil)
    expect(@blp.start).to eq(Date.parse('2013-5-15 8:19'))
    expect(@blp.finish).to eq(Date.parse('2013-5-15 8:19'))
    expect(@blp.clouds).to eq(nil)
    expect(@blp.light).to eq(nil)
    expect(@blp.rain).to eq(nil)
    expect(@blp.checked).to eq(true)
    expect(@blp.mean_branch_PPFD).to eq(17.85815535)
    expect(@blp.mean_ref_PPFD).to eq(242.686071)
    expect(@blp.rel_light_proportion).to eq(0.073585415)
    expect(@blp.time_advance).to eq(nil)
    expect(@blp.time_delay).to eq(nil)
    expect(@blp.validation_note).to eq(nil)
    expect(@blp.confidence).to eq(nil)
    expect(@blp.field_note).to eq('Luz radiante con sol directo')
    expect(@blp.quality_flag).to eq('')
    expect(@blp).to be_valid
  end

end

