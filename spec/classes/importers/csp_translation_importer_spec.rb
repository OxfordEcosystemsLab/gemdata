require 'spec_helper'
require 'csv'
require 'importer'

describe CspTranslationImporter do
  it_behaves_like 'Importer'

  before :each do
    @plot = set_up_plot('WAY-01')
  end

  it 'can read CSV and spot a tree code' do
    values = CSV.parse_line 'CSP28006,Hesperomeles,ferruginea,Hesperomeles ferruginea,Rosaceae,(Pers.) Benth.,26/04/2013,"Tree, shade",0,174,"Wayquecha; WAY-01, Peru",WAY-01'
    importer = CspTranslationImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    ct = importer.object.reload
    expect(ct.csp_code).to eq('CSP28006')
    expect(ct.genus).to eq('Hesperomeles')
    expect(ct.species).to eq('ferruginea')
    expect(ct.full_name).to eq('Hesperomeles ferruginea')
    expect(ct.family).to eq('Rosaceae')
    expect(ct.taxon_info).to eq('(Pers.) Benth.')
    expect(ct.date_collected).to eq(Date.parse('2013-04-26'))
    expect(ct.habit).to eq('Tree, shade')
    expect(ct.sun).to eq(false)
    expect(ct.tree_code).to eq('T174')
    expect(ct.branch_code).to eq('B11H')
    expect(ct.site).to eq('WAY-01')
  end

  it 'can spot a "B1S"' do
    values = CSV.parse_line 'CSP28015,Clethra,cuneata,Clethra cuneata,Clethraceae,Rusby,29/04/2013,Tree,1,787,"Wayquecha; WAY-01, Peru",WAY-01'
    importer = CspTranslationImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    ct = importer.object.reload
    expect(ct.branch_code).to eq('B1S')
  end

  it 'can spot an "individual" tree code' do
    values = CSV.parse_line 'CSP28029,Pentacalia,sp. 28009(CSP),Pentacalia sp. 28009(CSP),Asteraceae,,30/04/2013,Tree,1,I-2001,"Wayquecha; WAY-01, Peru",WAY-01'
    importer = CspTranslationImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    ct = importer.object.reload
    expect(ct.tree_code).to eq('I2001')
  end
  
    it 'should correctly create sub-plots, trees and branches for I9999 trees'  

end
