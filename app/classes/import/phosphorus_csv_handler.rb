require 'csv'
require 'csv_utility'

class PhosphorusCsvHandler < BaseCsvHandler

  attr_reader :phosphorus_curve

  private
    # override the base declarations
    def prepare_pre_import

      csv = CSV.read(File.open(@csv_file))

      @phosphorus_curve = PhosphorusCurve.batch_find_or_initialize_by(@batch.id, {})
      unless @phosphorus_curve.can_overwrite @batch.id, @overwrite_batch_id
        raise Gemdata::NoPermissionToOverwrite, "No permission to override PhosphorusCurve from a different batch: #{@phosphorus_curve.to_json}"
      end

      {0 => 0, 1 => 2, 2 => 4, 3 => 8, 4 => 12, 5 => 16}.each do |i, n|
        row = i + 3
        @phosphorus_curve.send("first_standard_#{n}=", CsvUtility.read_cell(csv, 'E', row))
        @phosphorus_curve.send("second_standard_#{n}=", CsvUtility.read_cell(csv, 'F', row))
        @phosphorus_curve.send("absorbance_#{n}=", CsvUtility.read_cell(csv, 'I', row))
        @phosphorus_curve.send("concentration_#{n}=", CsvUtility.read_cell(csv, 'J', row))
      end

      @phosphorus_curve.save!

    end

    def prepare_importer(importer)
      importer.phosphorus_curve = @phosphorus_curve
      super
    end

    def skip_row?(n, values)
      is_not_a_float or super
    end

    def is_not_a_float
      false if Float(values[0]) rescue true
    end

end
