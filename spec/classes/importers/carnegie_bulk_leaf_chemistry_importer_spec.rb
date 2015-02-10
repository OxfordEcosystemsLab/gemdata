require 'spec_helper'
require 'csv'
require 'importer'

def check_branch(id, branch_code, tree_code, plot_code)
  result = true
  branch = Branch.find(id)
  if branch.code != branch_code then
    result = false
  end
  if result then
    tree = Tree.find(branch.tree_id)
    if tree.tree_code != tree_code then
      result = false
    end
  end
  if result then
    sub_plot = SubPlot.find(tree.sub_plot_id)
    plot = Plot.find(sub_plot.plot_id)
    if plot.plot_code != plot_code then
      result = false
    end
  end
  result
end
  

describe CarnegieBulkLeafChemistryImporter do
  it_behaves_like 'Importer'

  before :each do
  end

  it 'can read CSV' do
    set_up_plot 'WAY-01'
    set_up_tree 'WAY-01', 'T32', '1', 1
    values = CSV.parse_line ',,CSP28001,Clusia,alata,,Clusia alata,Clusiaceae,Planch. & Triana,04/26/2013,Tree,32,B1S ,,,"Wayquecha; WAY-01, Peru",-13.1907,-71.5875,3045,Inceptisol,1705,12.5,1.31,2.94,1.08,0.94,59.79,-25.5,76.66,0.249,0.55,0.71,0.28,185.26,49.9,22.51,11.95,4.39,79.05,33.37,35.69,38.19,2107.46,24.59,,tree#_32;B1S,,'
    importer = CarnegieBulkLeafChemistryImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    cc = importer.object.reload
    expect(cc.flagged).to eq(nil)
    expect(cc.reason).to eq(nil)
    expect(cc.date_collected).to eq(Date.parse('2013-04-26'))
    expect(check_branch(cc.branch_1, 'B1S', 'T32', 'WAY-01')).to eq(true)
    expect(cc.branch_2).to eq(nil)
    expect(cc.branch_3).to eq(nil)
    expect(cc.n).to eq(1.31)
    expect(cc.chl_a).to eq(2.94)
    expect(cc.chl_b).to eq(1.08)
    expect(cc.carotenoids).to eq(0.94)
    expect(cc.soluble_c).to eq(59.79)
    expect(cc.delta_13c).to eq(-25.5)
    expect(cc.water).to eq(76.66)
    expect(cc.p).to eq(0.249)
    expect(cc.ca).to eq(0.55)
    expect(cc.k).to eq(0.71)
    expect(cc.mg).to eq(0.28)
    expect(cc.lma).to eq(185.26)
    expect(cc.c).to eq(49.9)
    expect(cc.lignin).to eq(22.51)
    expect(cc.cellulose).to eq(11.95)
    expect(cc.hemi_cellulose).to eq(4.39)
    expect(cc.phenols).to eq(79.05)
    expect(cc.tannins).to eq(33.37)
    expect(cc.b).to eq(35.69)
    expect(cc.fe).to eq(38.19)
    expect(cc.mn).to eq(2107.46)
    expect(cc.zn).to eq(24.59)
    expect(cc.batch_id).to eq(1)
  end
  
  it 'can read all 3 branch codes' do
    set_up_plot 'ESP-01'
    set_up_tree 'ESP-01', 'T175', '1', 1
    values = CSV.parse_line ',,CSP28109,Miconia,micropetala,,Miconia micropetala,Melastomataceae,Cogn.,05/10/2013,Tree,175,B2S,B3S,B4S,"Esperanza; ESP-01, Peru",-13.1759,-71.5948,2868,Inceptisol,1705,12.5,1.7,4.68,2.02,1.44,67.12,-28.8,59.37,0.086,0.85,0.46,0.21,120.28,46.2,9.88,13.37,10.33,20.47,81.62,20.71,136.24,48.53,20.18,,tree#_175;B2S;B3S;B4S,,'
    importer = CarnegieBulkLeafChemistryImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    cc = importer.object.reload
    expect(check_branch(cc.branch_1, 'B2S', 'T175', 'ESP-01')).to eq(true)
    expect(check_branch(cc.branch_2, 'B3S', 'T175', 'ESP-01')).to eq(true)
    expect(check_branch(cc.branch_3, 'B4S', 'T175', 'ESP-01')).to eq(true)
  end  

  it 'performs validation' do
    values = CSV.parse_line 'rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,garbage,trash,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish,rubbish'
    # The code reader should deal with bad codes more elegantly than it does
    importer = CarnegieBulkLeafChemistryImporter.new(1, 1)
    expect{importer.read_row(values, Array.new)}.to raise_error
  end
  
end
