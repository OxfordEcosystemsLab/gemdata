require 'spec_helper'
require 'csv'
require 'importer'

describe CoarseWoodyDebrisImporter do
  it_behaves_like 'Importer'

  before :each do
    @cwd_sub_transect = set_up_cwd_sub_transect('ESP-01', '1', '2', 10)
  end

  it 'can read CSV' do
    values = CSV.parse_line 'ESP-01,2009,5,10,1,2,10,,,3,1,,NaN,NaN,NaN,388.8,1,comment'

    importer = CoarseWoodyDebrisImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    o = importer.object.reload

    expect(o.cwd_sub_transect).to eq(@cwd_sub_transect)
    expect(o.date).to eq(Date.parse('2009-05-10'))

    expect(o.cwd_num).to       eq('3')
    expect(o.size_class).to    eq('1')
    expect(o.decay_class).to   be_nil
    expect(o.diameter_1_cm).to be_nil
    expect(o.diameter_2_cm).to be_nil
    expect(o.length_cm).to     be_nil
    expect(o.dry_weight_g).to  eq(388.8)

    expect(o.quality_code).to  eq('1')
    expect(o.comments).to      eq('comment')

    expect(o).to be_valid
  end

end
