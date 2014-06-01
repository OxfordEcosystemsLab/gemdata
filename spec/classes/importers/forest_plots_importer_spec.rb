require 'spec_helper'
require 'csv'
require 'importer'

describe ForestPlotsImporter do
  it_behaves_like 'Importer'

  it 'can read CSV' do
    values = CSV.parse_line '90,TAM-04,Tambopata plot two swamp edge clay,PERU,Oliver Phillips,1983.67,1,90,Main Plot View,,54832,377,Sapotaceae,24801,Pouteria,653110,Pouteria indet,,,2,105,105,105,105,1300,a,1,5,0,,,'

    result = ForestPlotsImporter.read_row(values, Array.new)
    tree = result.ar_class
    expect(result.status).to eq(Lookup::ImportStatus.inserted)

    expect(tree.fp_id).to eq(54832)
    expect(tree.tree_code).to eq('T2')

    plot = Plot.find(tree.sub_plot.plot_id)
    expect(plot.fp_id).to eq(90)
    expect(plot.plot_code).to eq('TAM04')

    species = tree.fp_species
    expect(species.name).to eq('Pouteria indet')
    expect(species.fp_id).to eq(653110)

    genus = species.fp_genus
    expect(genus.name).to eq('Pouteria')
    expect(genus.fp_id).to eq(24801)

    family = genus.fp_family
    expect(family.name).to eq('Sapotaceae')
    expect(family.apg_id).to eq(377)

    expect(tree).to be_valid
  end

  it 'selects existing plots'
  it 'selects existing species'
  it 'selects existing genera'
  it 'selects existing families'
end
