require 'csv'
require 'csv_utility'

class CnCsvHandler < BaseCsvHandler

  attr_reader :cn_curve

  private
    # override the base declarations
    def prepare_pre_import

      csv = CSV.read(File.open(@csv_file))

      @cn_curve = CnCurve.batch_find_or_initialize_by(@batch.id, {
        date: CsvUtility.read_cell(csv, 'M', 4),
        label: CsvUtility.read_cell(csv, 'J', 7)
      })
      unless @cn_curve.can_overwrite @batch.id, @overwrite_batch_id
        raise Gemdata::NoPermissionToOverwrite, "No permission to override CnCurve from a different batch: #{@cn_curve.to_json}"
      end

      (1..8).each do |n|
        row = n + 10
        @cn_curve.send("c_enr_#{n}=",     CsvUtility.read_cell(csv, 'N', row))
        @cn_curve.send("n_enr_#{n}=",     CsvUtility.read_cell(csv, 'O', row))
        @cn_curve.send("c_percent_#{n}=", CsvUtility.read_cell(csv, 'P', row))
        @cn_curve.send("n_percent_#{n}=", CsvUtility.read_cell(csv, 'Q', row))
        @cn_curve.send("cn_ratio_#{n}=",  CsvUtility.read_cell(csv, 'R', row))
      end

      @cn_curve.save!

    end

    def prepare_importer(importer)
      importer.cn_curve = @cn_curve
      super
    end

    def skip_row?(n, values)
      is_not_a_float or super
    end

    def is_not_a_float
      false if Float(values[0]) rescue true
    end

end
