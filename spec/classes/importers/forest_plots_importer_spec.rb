require 'spec_helper'
require 'csv'
require 'importer'

describe ForestPlotsImporter do

  it_behaves_like 'Importer'

  let(:logger) {ImportLogger.new(Array.new)}

  before :each do
    Batch.find_or_create_by!(id:1)
    @values = CSV.parse_line '90,TAM-04,Tambopata plot two swamp edge clay,PERU,Oliver Phillips,1983.67,1,90,Main Plot View,1,54832,377,Sapotaceae,24801,Pouteria,653110,Pouteria indet,,,2,105,105,105,105,1300,a,1,5,0,,,'
  end

  it 'can read CSV' do
    importer = ForestPlotsImporter.new(1, 2)
    status = importer.read_row(@values, logger)
    expect(status).to eq(Lookup::ImportStatus.inserted)

    tree = importer.object.reload
    expect(tree.fp_id).to eq(54832)
    expect(tree.tree_code).to eq('T2')

    plot = Plot.find(tree.sub_plot.plot_id)
    expect(plot.fp_id).to eq(90)
    expect(plot.plot_code).to eq('TAM-04')
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
    plot = Plot.find_or_create_by(:plot_code => 'TAM-04', :fp_id => 90, batch_id: 1)
    subplot = SubPlot.find_or_create_by!(:plot => plot, :sub_plot_code => '1', batch_id: 1)

    importer = ForestPlotsImporter.new(1, 1)
    importer.read_row(@values, logger)
    expect(importer.object.reload.sub_plot.plot).to eq(plot)
    expect(importer.object.reload.sub_plot).to eq(subplot)
  end

  it 'selects existing species complex' do
    fp_family = FpFamily.find_or_create_by!(apg_id: 377, name: 'Sapotaceae', batch_id: 1)
    fp_genus = FpGenus.create!(fp_id: 24801, name: 'Pouteria', fp_family: fp_family, batch_id: 1)
    fp_species = FpSpecies.create!(fp_id: 653110, name: 'Pouteria indet', fp_genus: fp_genus, batch_id: 1)

    importer = ForestPlotsImporter.new(1, 2)
    importer.read_row(@values, logger)
    expect(importer.object.reload.fp_species).to eq(fp_species)
  end

  it 'creates selects an existing census' do
    plot = Plot.find_or_create_by(:plot_code => 'TAM-04', :fp_id => 90, batch_id: 1)
    sub_plot = SubPlot.find_or_create_by!(:plot_id => plot.id, :sub_plot_code => '1', batch_id: 1)
    fp_species = FpSpecies.new
    tree = Tree.create!(:tree_code => 'T2', :sub_plot => sub_plot, :fp_species => fp_species, :fp_id => 54832, batch_id: 1)
    census = Census.create!(number: 1, mean_date: '1983.67', plot: plot, batch_id: 1)

    importer = ForestPlotsImporter.new(1, 1)
    importer.read_row(@values, logger)
    expect(importer.object.reload.censuses).to include(census)
  end

  it 'should not incorrectly flag duplicates' do
    first_importer = ForestPlotsImporter.new(1, 2)
    first_status   = first_importer.read_row(@values, logger)

    second_values   = CSV.parse_line '90,TAM-04,Tambopata plot two swamp edge clay,PERU,Oliver Phillips,1990.755,3,90,Main Plot View,1,54832,377,Sapotaceae,24801,Pouteria,653110,Pouteria indet,,,2,121,121,121,121,1300,a,1,5,0,,,'
    second_importer = ForestPlotsImporter.new(1, 1)
    second_status   = second_importer.read_row(second_values, logger)
    expect(second_status).to eq(Lookup::ImportStatus.skipped)
    expect(second_importer.object.reload).to be_valid
    expect(second_importer.object.reload).to eq(first_importer.object.reload)
  end

  it 'should not set a duplicate tag for collisions' do
    first_importer = ForestPlotsImporter.new(1, 2)
    first_status   = first_importer.read_row(@values, logger)

    second_values   = CSV.parse_line '90,TAM-04,Tambopata plot two swamp edge clay,PERU,Oliver Phillips,1983.67,1,90,Main Plot View,1,12345,377,Sapotaceae,24801,Pouteria,653110,Pouteria indet,,,2,105,105,105,105,1300,a,1,5,0,,,'
    second_importer = ForestPlotsImporter.new(1, 2)
    second_status   = second_importer.read_row(second_values, logger)
    expect(second_status).to eq(Lookup::ImportStatus.inserted)
    expect(second_importer.object.reload).to be_valid
    expect(second_importer.object.reload.tree_code).to eq('DUP2')
    expect(second_importer.object.reload).to_not eq(first_importer.object.reload)
  end

  it 'should be able to delete forest_import record using sql' do
    batch = Batch.find_or_create_by!(id:2)
    importer = ForestPlotsImporter.new(batch.id, 1)
    status = importer.read_row(@values, logger)
    tree = importer.object.reload
    
    custom_sql = "
      DELETE from dbh_measurements d USING trees t, sub_plots sp, plots p
      WHERE  d.tree_id = #{tree.id}
      AND t.sub_plot_id = #{tree.sub_plot_id}
      AND  sp.plot_id = #{tree.sub_plot.plot_id}
      AND p.plot_code = 'TAM-04';

      DELETE from trees t USING sub_plots sp, plots p
      WHERE t.sub_plot_id = #{tree.sub_plot_id}
      AND  sp.plot_id = #{tree.sub_plot.plot_id}
      AND p.plot_code = 'TAM-04';
      COMMIT;
    "

    ActiveRecord::Base.connection.execute(custom_sql)
    expect(status).to eq(Lookup::ImportStatus.inserted)
    expect{Tree.find(tree.id)}.to raise_exception(ActiveRecord::RecordNotFound)
  end

  it 'should be able to save forest_import record after an sql delete' do
    batch = Batch.find_or_create_by!(id:2)
    importer = ForestPlotsImporter.new(batch.id, 1)
    status = importer.read_row(@values, logger)
    tree = importer.object.reload
    tree_from_db = Tree.find(tree.id)
    expect(tree_from_db.id).to eq(tree.id)
  end

  it 'should trim imports damn it!'


end
