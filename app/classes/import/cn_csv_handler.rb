require 'csv'

class CnCsvHandler < BaseCsvHandler

  private
    # override the base declarations
    def prepare_pre_import

      csv = CSV.read(File.open(@csv_file))

      @cn_curve = CnCurve.new

      date = csv_read_cell(csv, 'M', 4)
      label = csv_read_cell(csv, 'J', 7)

      (1..8).each do |n|
        row = n + 10
        @cn_curve.send("c_enr_#{n}=",    csv_read_cell(csv, 'N', row))
        @cn_curve.send("n_enr_#{n}=",    csv_read_cell(csv, 'O', row))
        @cn_curve.send("c_percent#{n}=", csv_read_cell(csv, 'P', row))
        @cn_curve.send("n_percent#{n}=", csv_read_cell(csv, 'Q', row))
        @cn_curve.send("cn_ratio#{n}=",  csv_read_cell(csv, 'R', row))
      end

    end

    def prepare_importer(importer)
      importer.cn_curve = @cn_curve
    end

    def csv_read_cell(csv, column, row) do
      csv[row - 1][letter_to_number(column) - 1]
    end

    def letter_to_number(letter)
      letters = ('A'..'Z').to_a
      letters.find_index(letter) + 1
    end
end
