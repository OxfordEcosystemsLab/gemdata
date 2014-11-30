require 'spec_helper'
require 'csv'
require 'importer'

describe FineLitterfallImporter do
  it_behaves_like 'Importer'

  before :each do
    @litterfall_trap = set_up_litterfall_trap('ESP-01', '13', 0.25)
  end

  it 'can read CSV' do
    values = CSV.parse_line 'ESP-01,2009,3,13,13,0.25,0.64,0.13,0.13,0.63,0.03,0.04,0,NaN,NaN,NaN,,'

    importer = FineLitterfallImporter.new(1, 2)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    o = importer.object.reload

    expect(o.litterfall_trap).to eq(@litterfall_trap)
    expect(o.collection_date).to eq(Date.parse('2009-03-13'))

    expect(o.leaves_g_per_trap).to     eq(0.64)
    expect(o.twigs_g_per_trap).to      eq(0.13)
    expect(o.flowers_g_per_trap).to    eq(0.13)
    expect(o.fruits_g_per_trap).to     eq(0.63)
    expect(o.bromeliads_g_per_trap).to eq(0.03)
    expect(o.epiphytes_g_per_trap).to  eq(0.04)
    expect(o.other_g_per_trap).to      eq(0)
    expect(o.palm_leaves_g).to         be_nil

    expect(o).to be_valid
  end

end
