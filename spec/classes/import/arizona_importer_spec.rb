require 'spec_helper'

describe ArizonaImporter do

  before :each do
    plot = Plot.create(:plot_code => 'WAY01')
    tree = TraitsTree.first_or_create(:code => 'CSP28001-32', :plot => plot)
    branch = Branch.first_or_create(:code => 'SUN', :traits_tree => tree)
    @leaf = Leaf.where(:code => 'L1L', :branch => branch).create
  end

  it 'can read CSV with leaf code L' do
    csv = 'Wayqecha,26/04/2013,Naia-Colby,Clusia alata,WAY01-CSP28001-32-SUN-L1L,4.41,1.07,0.820,-,comments'

    importer = ArizonaImporter.new
    importer.read_csv csv
    az = importer.get_object

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
    csv = 'Wayqecha,26/04/2013,Naia-Colby,Hesperomeles ferruginea,WAY01-CSP28003-77-SUN-L1P,0.07,0.02,-,2.07,'

    importer = ArizonaImporter.new
    importer.read_csv csv
    az = importer.get_object

    expect(az.petiole_width).to eq(2.07)

    expect(az).to be_valid
  end

  it 'also behaves nicely for leaf code T' do
    csv = 'Wayqecha,26/04/2013,Naia-Colby,Hesperomeles ferruginea,WAY01-CSP28003-77-SUN-L1T,0.07,0.02,-,2.07,'

    importer = ArizonaImporter.new
    importer.read_csv csv
    az = importer.get_object

    expect(az).to be_valid
  end

  it 'interprets 0.00, 0 and - as nil' do
    csv = 'Wayqecha,26/04/2013,Naia-Colby,Hesperomeles ferruginea,WAY01-CSP28003-77-SUN-L1T,0,0.00,-,,'

    importer = ArizonaImporter.new
    importer.read_csv csv
    az = importer.get_object

    expect(az.fresh_mass).to be_nil
    expect(az.dry_mass).to be_nil
    expect(az.thickness).to be_nil
    expect(az.petiole_width).to be_nil

    expect(az).to_not be_valid
  end
end
