require 'spec_helper'
require 'csv'

describe WoodDensityImporter do

  before :each do
    plot = Plot.create!(:plot_code => 'ACJ01')
    sub_plot = SubPlot.create!(:plot_id => plot.id)
    fp_species = FpSpecies.new
    tree = Tree.create!(:tree_code => 'T802', :sub_plot_id => sub_plot.id, :fp_species => fp_species)
    @branch = CodeReader.new('ACJ01-T802-B1S,CC1,6.24').find_or_create_branch
  end

  it 'can read CSV' do
    values = CSV.parse_line 'Acjnaco,20/05/2013,Omayra,ACJ01-T802-B1S,CC1,6.24'
    result = WoodDensityImporter.read_row(values, Array.new)
    wood = result.ar_class
    expect(result.status).to eq(Lookup::ImportStatus.inserted)

    expect(wood.branch).to eq(@branch)
    expect(wood.date).to eq(Date.new(2013,05,20))
    expect(wood.evaluator).to eq('Omayra')
    expect(wood.branch_number).to eq('CC1')
    expect(wood.volume).to eq(6.24)
    expect(wood).to be_valid
  end

  it 'performs validation' do
    values = CSV.parse_line 'Acjnaco,20/05/2013,Omayra,ACJ01-T802-B1S,EC9,,'
    result = WoodDensityImporter.read_row(values, Array.new)
    wood = result.ar_class

    expect(result.status).to eq(Lookup::ImportStatus.failed)
    expect(wood).to_not be_valid
    expect(wood).to have(1).error_on(:branch_number)
    expect(wood).to have(2).error_on(:volume)

  end
end
