require 'spec_helper'
require 'csv'
require 'importer'

describe ForestPlotsImporter do

  it_behaves_like 'Importer'

  before :each do
    @values = CSV.parse_line '90,TAM-04,Tambopata plot two swamp edge clay,PERU,Oliver Phillips,1983.67,1,90,Main Plot View,,54832,377,Sapotaceae,24801,Pouteria,653110,Pouteria indet,,,2,105,105,105,105,1300,a,1,5,0,,,'
  end

  it 'can read CSV' do

    importer = ForestPlotsImporter.new
    status = importer.read_row(@values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    tree = importer.object
    expect(tree.fp_id).to eq(54832)
    expect(tree.tree_code).to eq('T2')

    plot = Plot.find(tree.sub_plot.plot_id)
    expect(plot.fp_id).to eq(90)
    expect(plot.plot_code).to eq('TAM04')
    expect(plot.plot_desc).to eq('Tambopata plot two swamp edge clay')

    species = tree.fp_species
    expect(species.name).to eq('Pouteria indet')
    expect(species.fp_id).to eq(653110)

    genus = species.fp_genus
    expect(genus.name).to eq('Pouteria')
    expect(genus.fp_id).to eq(24801)

    family = genus.fp_family
    expect(family.name).to eq('Sapotaceae')
    expect(family.apg_id).to eq(377)

    census = tree.censuses.first!
    expect(census.mean_date).to eq('1983.67')
    expect(census.number).to eq(1)

    dbh = tree.dbh_measurements.first!
    expect(dbh.value).to eq(105)
    expect(dbh.census).to eq(census)

    expect(tree).to be_valid
  end

  it 'selects existing plots and subplots' do

    plot = Plot.create!(:plot_code => 'TAM04', :fp_id => 90)

    importer = ForestPlotsImporter.new
    importer.read_row(@values, Array.new)
    expect(importer.object.sub_plot.plot).to eq(plot)

  end

  it 'selects existing species complex' do

    fp_family = FpFamily.create!(apg_id: 377, name: 'Sapotaceae')
    fp_genus = FpGenus.create!(fp_id: 24801, name: 'Pouteria', fp_family: fp_family)
    fp_species = FpSpecies.create!(fp_id: 653110, name: 'Pouteria indet', fp_genus: fp_genus)

    importer = ForestPlotsImporter.new
    importer.read_row(@values, Array.new)
    expect(importer.object.fp_species).to eq(fp_species)

  end

  it 'creates selects an existing census' do

    plot = Plot.create!(:plot_code => 'TAM04', :fp_id => 90)
    census = Census.create!(number: 1, mean_date: '1983.67', plot: plot)

    importer = ForestPlotsImporter.new
    importer.read_row(@values, Array.new)
    expect(importer.object.censuses).to include(census)

  end

end
