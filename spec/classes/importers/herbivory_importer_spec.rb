require 'spec_helper'
require 'csv'
require 'importer'

describe HerbivoryImporter do
  it_behaves_like 'Importer'

  it 'can read CSV' do
    # should be ACJ-01 but don't have time to fix the code reader in tests
    leaf = set_up_leaf 'ACJ-01', 'T802', 'B3S', 'HR1'
    values = CSV.parse_line '"ACJ01-T802-B3S","HR1","ACJ01-T802-B3S-HA-3","5/20/2013",14.027,11.52,2.507,17.87267413,lickety split,terrible'

    importer = HerbivoryImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    o = importer.object.reload

    expect(o.leaf).to eq(leaf)
    expect(o.original_code).to eq('ACJ01-T802-B3S-HA-3')
    expect(o.date).to eq(Date.parse('2013-05-20'))
    expect(o.estimated_full_la).to eq(14.027)
    expect(o.observed_remaining_la).to eq(11.52)
    expect(o.consumed_la).to eq(2.507)
    expect(o.percent_consumed).to eq(17.87267413)
    expect(o.note).to eq('lickety split')
    expect(o.quality_flag).to eq('terrible')

    expect(o).to be_valid
  end
end

