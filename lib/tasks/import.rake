namespace :import do

  desc "Import csv data into csv holding tables"

  task csv_data: :environment do
    csv_file_path = Rails.root.join('db', 'import', "DendEltr_v2_sample.csv")
    csv_importer = CSVDataImporter.new(DendrometerValues, csv_file_path)
    csv_importer.import!
  end

end
