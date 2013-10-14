namespace :import do

  desc "Import csv data into csv holding tables"

  task csv_data: :environment do
    # csv_importer = CSVDataImporter.new(IngrowthCoreValues, "ICEltr_sample.csv")
    csv_importer = CSVDataImporter.new(DendrometerValues, "DendEltr_v2_sample.csv")
    csv_importer.import!
  end

end
