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
      RespirationPartitioningValues,
      MonthlyAveragesValues
    ]
  end

  def create
    if params[:file]
      if valid_mime_type?(params[:file].content_type)
        import_id = SecureRandom.hex
        import_log = ImportLog.new(import_id)
        ar_class = params[:csv_class].constantize
        csv_importer = CSVDataImporter.new(ar_class, params[:file].tempfile, import_log)
        csv_importer.import! # In background
        redirect_to csv_upload_path(id: import_id)
      else
        flash[:notice] = "This file does not appear to be a valid csv file. It has a content type of: #{params[:file].content_type}"
        redirect_to new_csv_upload_path
      end
    else
      flash[:notice] = "Please select a csv file."
      redirect_to new_csv_upload_path
    end
  end

  def show
    @results = ImportLog.get_results(params[:id])
  end

  def valid_mime_type?(content_type)
    ["text/csv", "application/vnd.ms-excel"].include?(content_type)
  end

end
