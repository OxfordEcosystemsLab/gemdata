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

  it 'can read CSV' do
    set_up_branch('WAY-01', 'T812', 'B1S', 1)
    values = CSV.parse_line 'Note,High C,CSP28009,Pensp.,Pentacalia,sp. 28009(CSP),,Pentacalia sp. 28009(CSP),Asteraceae,,28/04/2013,Tree,812,B1S,,,"Wayquecha; WAY-01, Peru",09.WAY-01,-13.19067893,-71.58747769,3045,Inceptisol,Tropical Montane Wet Forest,1705,12.5,2.77,4.56,1.61,6.17,1.41,52.79,-30.3,75.8,0.257,0.72,1.36,0.54,65.75,56,12.69,19.3,13.87,51.03,37.14,33.91,56.58,1409.9,14.25,2,,tree#_812;B1S,,,Note,High C'
    importer = CarnegieBulkLeafChemistryImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    cc = importer.object.reload
    expect(cc.flagged).to eq('Note')
    expect(cc.reason).to eq('High C')
    expect(cc.csp_code).to eq('CSP28009')
    expect(cc.date_collected).to eq(Date.strptime('28/04/2013', "%d/%m/%Y"))
    expect(check_branch(cc.branch_1, 'B1S', 'T812', 'WAY-01')).to eq(true)
    expect(cc.n).to eq(2.77)
    expect(cc.chl_a).to eq(4.56)
    expect(cc.chl_b).to eq(1.61)
    expect(cc.carotenoids).to eq(1.41)
    expect(cc.soluble_c).to eq(52.79)
    expect(cc.delta_13c).to eq(-30.3)
    expect(cc.water).to eq(75.8)
    expect(cc.p).to eq(0.257)
    expect(cc.ca).to eq(0.72)
    expect(cc.k).to eq(1.36)
    expect(cc.mg).to eq(0.54)
    expect(cc.lma).to eq(65.75)
    expect(cc.c).to eq(56)
    expect(cc.lignin).to eq(12.69)
    expect(cc.cellulose).to eq(19.3)
    expect(cc.hemi_cellulose).to eq(13.87)
    expect(cc.phenols).to eq(51.03)
    expect(cc.tannins).to eq(37.14)
    expect(cc.b).to eq(33.91)
    expect(cc.fe).to eq(56.58)
    expect(cc.mn).to eq(1409.9)
    expect(cc.zn).to eq(14.25)
  end

  it 'can read all 3 branch codes' do
    set_up_branch('WAY-01', 'T812', 'B1S', 1)
    set_up_branch('WAY-01', 'T812', 'B2S', 1)
    set_up_branch('WAY-01', 'T812', 'B3S', 1)
    values = CSV.parse_line 'Note,High C,CSP28009,Pensp.,Pentacalia,sp. 28009(CSP),,Pentacalia sp. 28009(CSP),Asteraceae,,28/04/2013,Tree,812,B1S,B2S,B3S,"Wayquecha; WAY-01, Peru",09.WAY-01,-13.19067893,-71.58747769,3045,Inceptisol,Tropical Montane Wet Forest,1705,12.5,2.77,4.56,1.61,6.17,1.41,52.79,-30.3,75.8,0.257,0.72,1.36,0.54,65.75,56,12.69,19.3,13.87,51.03,37.14,33.91,56.58,1409.9,14.25,2,,tree#_812;B1S,,,Note,High C'
    importer = CarnegieBulkLeafChemistryImporter.new(1, 1)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    cc = importer.object.reload
    expect(check_branch(cc.branch_1, 'B1S', 'T812', 'WAY-01')).to eq(true)
    expect(check_branch(cc.branch_2, 'B2S', 'T812', 'WAY-01')).to eq(true)
    expect(check_branch(cc.branch_3, 'B3S', 'T812', 'WAY-01')).to eq(true)
  end  

end
