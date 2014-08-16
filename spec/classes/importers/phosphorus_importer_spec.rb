require 'spec_helper'
require 'csv'
require 'importer'

describe PhosphorusImporter do
  it_behaves_like 'Importer'

  before :each do
    @leaf = set_up_leaf('SPD01', 'T541', 'B1S', 'L5', 1)

    @phosphorus_curve = PhosphorusCurve.new
  end

  it 'can read CSV' do

    values = CSV.parse_line 'PERU,SPD01-T541-B1S-L5,tray1,1,A,3743,0.11,0.1558105509,20,3.1162110176,0.0832543686,,,,0.0823,,,,'

    importer = PhosphorusImporter.new(1, 2)
    importer.phosphorus_curve = @phosphorus_curve
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    cn = importer.object
    expect(cn).to be_valid
    expect(cn.leaf).to eq(@leaf)
    expect(cn.phosphorus_curve).to eq(@phosphorus_curve)

    expect(cn.column).to eq('A')
    expect(cn.row).to eq(1)
    expect(cn.sample_mass).to eq(3743)
    expect(cn.sample_absorbance).to eq(0.11)
    expect(cn.sample_concentration).to eq(0.1558105509)
    expect(cn.sample_volume).to eq(20)
    expect(cn.p_mass).to eq(3.1162110176)
    expect(cn.p_original).to eq(0.0832543686)
    expect(cn.corrected_std).to eq(0.0823)

  end

  it 'can assign a phosphorus_curve' do
    expect(described_class.new(1, 2)).to respond_to(:phosphorus_curve=)
  end
end
