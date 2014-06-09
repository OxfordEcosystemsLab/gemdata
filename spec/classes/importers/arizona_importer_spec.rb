require 'spec_helper'
require 'csv'
require 'importer'

describe ArizonaImporter do
  it_behaves_like 'Importer'

  before :each do
    plot = Plot.create!(:plot_code => 'WAY01')
    sub_plot = SubPlot.create!(:plot_id => plot.id)
    fp_species = FpSpecies.new
    tree = Tree.create!(:tree_code => 'CSP28001-32', :sub_plot => sub_plot, :fp_species => fp_species)
    branch = Branch.create(:code => 'SUN', :tree_id => tree.id)
    @leaf = Leaf.create! :code => 'L1L', :branch => branch
  end

  it 'can read CSV with leaf code L' do
    values = CSV.parse_line 'Wayqecha,26/04/2013,Naia-Colby,Clusia alata,WAY01-CSP28001-32-SUN-L1L,4.41,1.07,0.820,-,comments'

    importer = ArizonaImporter.new
    importer.read_row(values, Array.new)
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    az = importer.object
    expect(az.leaf).to eq(@leaf)
    expect(az.date).to eq(Date.new(2013,04,26))
    expect(az.evaluators).to eq('Naia-Colby')
    expect(az.fresh_mass).to eq(4.41)
    expect(az.dry_mass).to eq(1.07)
    expect(az.thickness).to eq(0.820)
    expect(az.petiole_width).to be_nil
    expect(az.comments).to eq('comments')

    expect(az).to be_valid
  end

  it 'can read CSV with leaf code P' do
    values = CSV.parse_line 'Wayqecha,26/04/2013,Naia-Colby,Hesperomeles ferruginea,WAY01-CSP28001-32-SUN-L1P,0.07,0.02,-,2.07,'

    importer = ArizonaImporter.new
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    az = importer.object
    expect(az.petiole_width).to eq(2.07)
    expect(az).to be_valid

  end

  it 'also behaves nicely for leaf code T' do
    values = CSV.parse_line 'Wayqecha,26/04/2013,Naia-Colby,Hesperomeles ferruginea,WAY01-CSP28001-32-SUN-L1T,0.07,0.02,-,2.07,'

    importer = ArizonaImporter.new
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    expect(importer.object).to be_valid

  end

  it 'interprets 0.00, 0 and - as nil' do
    values = CSV.parse_line 'Wayqecha,26/04/2013,Naia-Colby,Hesperomeles ferruginea,WAY01-CSP28001-32-SUN-L1T,0,0.00,-,,'

    importer = ArizonaImporter.new
    status = importer.read_row(values, Array.new)
    expect(status).to eq(Lookup::ImportStatus.failed)

    az = importer.object
    expect(az).to_not be_valid
    expect(az.fresh_mass).to be_nil
    expect(az.dry_mass).to be_nil
    expect(az.thickness).to be_nil
    expect(az.petiole_width).to be_nil

  end
end
