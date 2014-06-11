class CsvUtility

  def self.read_cell(csv, column, row)
    csv[row - 1][letter_to_number(column) - 1]
  end

  private

    def self.letter_to_number(letter)
      letters = ('A'..'Z').to_a
      letters.find_index(letter) + 1
    end

end
