require 'spec_helper'

describe ForestPlotsImporter do

  it 'can read CSV' do
    csv = '90,TAM-04,Tambopata plot two swamp edge clay,PERU,Oliver Phillips,1983.67,1,90,Main Plot View,,54832,377,Sapotaceae,24801,Pouteria,653110,Pouteria indet,,,2,105,105,105,105,1300,a,1,5,0,,,'

    importer = ForestPlotsImporter.new
    importer.read_csv csv
    tree = importer.get_object

    expect(tree.fp_id).to eq(54832)

    plot = tree.plot
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
