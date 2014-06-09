require 'spec_helper'
require 'csv'
require 'importer'

describe CnImporter do
  it_behaves_like 'Importer'

  before :each do
    plot = Plot.create!(:plot_code => 'SPD01')
    sub_plot = SubPlot.create!(:plot_id => plot.id)

    fp_species = FpSpecies.new

    tree = Tree.create!(:tree_code => 'T541', :sub_plot => sub_plot, :fp_species => fp_species)
    branch = Branch.create(:code => 'B1S', :tree_id => tree.id)
    @leaf = Leaf.create! :code => 'L5', :branch => branch

    @cn_curve = CnCurve.new
  end

  it 'can read CSV' do

    values = CSV.parse_line '1,SPD01-T541-B1S-L5,PERU,A,1,49.4,1.4,36.3,,-3.3,-27.7,,,-29.35 ,-2.16 ,71.11,10.37,6.85'

    importer = CnImporter.new
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

  it {should respond_to(:cn_curve=)}
end
