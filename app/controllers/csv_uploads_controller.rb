class CsvUploadsController < ApplicationController

  def new
    @import_classes = [
      DendrometerImports,
      SmallStemImports,
      FineLitterfallImports,
      LeafAreaIndexImports,
      IngrowthCoreImports,
      CoarseWoodyDebrisImports,
      StemRespirationImports,
      LeafRespirationImports,
      RespirationControlImports,
      RespirationPartitioningImports,
      MonthlyAveragesImports,
      PlotMetadataImports,
      GlobalNetworkImports
    ]
  end

  def traits
    @import_classes = [
      ArizonaImporter,
      WoodDensityImporter,
      ForestPlotsImporter
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
    ["text/comma-separated-values", "text/csv", "application/csv", "application/excel", "application/vnd.ms-excel", "application/vnd.msexcel"].include?(content_type)
  end

end
