namespace :import do

  desc "Import csv data into csv holding tables"

  task csv_data: :environment do
    csv_importer = CSVDataImporter.new
    csv_importer.import_all
  end

end
