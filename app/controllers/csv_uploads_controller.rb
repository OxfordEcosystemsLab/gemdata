class CsvUploadsController < ApplicationController

  # LeafAreaIndexImports,
  # IngrowthCoreImports,
  # CoarseWoodyDebrisImports,
  # StemRespirationImports,
  # LeafRespirationImports,
  # RespirationControlImports,
  # RespirationPartitioningImports,
  # MonthlyAveragesImports,
  # PlotMetadataImports,
  # GlobalNetworkImports

  def cycles
    @import_classes = [
      LargeTreeDendrometerReadingImporter,
      SmallTreeDendrometerReadingImporter,
      FineLitterfallImporter
    ]
  end

  def traits
    @importer_classes = [
      BranchArchitectureImporter,
      BranchLightMeasurementImporter,
      BranchLightPlacementImporter,
      CnImporter,
      CnpMeasurementImporter,
      CrownDimensionImporter,
      CrownPerimeterImporter,
      ForestPlotsImporter,
      LeafAreaImporter,
      LeafMorphologyImporter,
      LeafRepellencyImporter,
      LightHangingImporter,
      LightStringMeasurementImporter,
      OsmometryImporter,
      PhosphorusImporter,
      SpectraMeasurementImporter,
      ToughnessMeasurementImporter,
      WeatherReadingImporter,
      WoodDensityImporter,
    ]
  end

  def create
    if params[:file]
      if valid_mime_type?(params[:file].content_type)
        import_id = SecureRandom.hex
        import_log = ImportLog.new(import_id)
        importer_class = params[:csv_class].constantize
        overwrite_batch_id = params[:overwrite_batch_id]
        csv_importer = importer_class.handler_class.new(importer_class, params[:file].tempfile, import_log, overwrite_batch_id)
        csv_importer.import! # In background
        redirect_to csv_upload_path(id: import_id)
      else
        flash[:notice] = "This file does not appear to be a valid csv file. It has a content type of: #{params[:file].content_type}"
        redirect_to cycles_csv_uploads_path
      end
    else
      flash[:notice] = "Please select a csv file."
      redirect_to cycles_csv_uploads_path
    end
  end

  def show
    @results = ImportLog.get_results(params[:id])
  end

  def valid_mime_type?(content_type)
    ["text/comma-separated-values", "text/csv", "application/csv", "application/excel", "application/vnd.ms-excel", "application/vnd.msexcel"].include?(content_type)
  end

end
