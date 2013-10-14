class CsvUploadsController < ApplicationController

  def new
    @import_classes = [
      DendrometerValues,
      SmallStemValues,
      FineLitterfallValues,
      LeafAreaIndexValues,
      IngrowthCoreValues,
      CoarseWoodyDebrisValues,
      StemRespirationValues,
      LeafRespirationValues,
      RespirationControlValues,
      RespirationPartitioningValues
    ]
  end

  def create
    if params[:file]
      import_id = SecureRandom.hex
      import_log = ImportLog.new(import_id)
      ar_class = params[:csv_class].constantize
      csv_importer = CSVDataImporter.new(ar_class, params[:file].tempfile, import_log)
      Thread.new do
        csv_importer.import!
      end
      redirect_to csv_upload_path(id: import_id)
    else
      redirect_to new_csv_upload_path
    end
  end

  def show
    @results = ImportLog.get_results(params[:id])
  end

end
