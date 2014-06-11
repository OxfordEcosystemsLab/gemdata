require 'csv'
require 'csv_utility'

class CnCsvHandler < BaseCsvHandler

  attr_reader :cn_curve

  private
    # override the base declarations
    def prepare_pre_import

      csv = CSV.read(File.open(@csv_file))

      @cn_curve = CnCurve.new

      date = CsvUtility.read_cell(csv, 'M', 4)
      label = CsvUtility.read_cell(csv, 'J', 7)

      (1..8).each do |n|
        row = n + 10
        @cn_curve.send("c_enr_#{n}=",     CsvUtility.read_cell(csv, 'N', row))
        @cn_curve.send("n_enr_#{n}=",     CsvUtility.read_cell(csv, 'O', row))
        @cn_curve.send("c_percent_#{n}=", CsvUtility.read_cell(csv, 'P', row))
        @cn_curve.send("n_percent_#{n}=", CsvUtility.read_cell(csv, 'Q', row))
        @cn_curve.send("cn_ratio_#{n}=",  CsvUtility.read_cell(csv, 'R', row))
      end

    end

    def prepare_importer(importer)
      importer.cn_curve = @cn_curve
    end

    end

end
