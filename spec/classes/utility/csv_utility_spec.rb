require 'spec_helper'

describe CsvUtility do

  it '.read_cell' do

    test = [['A1', 'B1'], ['A2', 'B2']]
    expect(CsvUtility.read_cell test, 'A', 1).to eq('A1')
    expect(CsvUtility.read_cell test, 'B', 1).to eq('B1')
    expect(CsvUtility.read_cell test, 'A', 2).to eq('A2')
    expect(CsvUtility.read_cell test, 'B', 2).to eq('B2')

  end

end
