require 'spec_helper'
require 'csv'
require 'importer'

describe CnImporter do
  it_behaves_like 'Importer'

  before :each do
    @leaf = set_up_leaf('SPD01', 'T541', 'B1S', 'L5', 1)

    @cn_curve = CnCurve.new
  end

  it 'can read CSV' do

    values = CSV.parse_line '1,SPD01-T541-B1S-L5,PERU,A,1,49.4,1.4,36.3,,-3.3,-27.7,,,-29.35 ,-2.16 ,71.11,10.37,6.85'

    importer = CnImporter.new(1, 2)
    importer.cn_curve = @cn_curve
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    cn = importer.object
    expect(cn).to be_valid
    expect(cn.leaf).to eq(@leaf)
    expect(cn.cn_curve).to eq(@cn_curve)

    expect(cn.row).to eq('A')
    expect(cn.column).to eq(1)
    expect(cn.c_percent).to eq(49.4)
    expect(cn.n_percent).to eq(1.4)
    expect(cn.cn_ratio).to eq(36.3)
    expect(cn.n15_delta).to eq(-3.3)
    expect(cn.c13_delta).to eq(-27.7)

  end

  it 'can assign a cn_curve' do
    expect(described_class.new(1, 2)).to respond_to(:cn_curve=)
  end
end
