require 'spec_helper'
require 'exceptions'

class FakeImporter < RowImporter

  attr_writer :phosphorus_curve

  def self.table_name
    'test'
  end

  def self.ar_class
    Tree
  end

  def read_row(values, logger)
    Float values[0]
    Lookup::ImportStatus.inserted
  end
end

describe PhosphorusCsvHandler do

  it 'can do an import with a phosphorus_curve' do

    tree = set_up_tree('SPD01', 'T231')

    handler = PhosphorusCsvHandler.new(FakeImporter, "#{Rails.root}/spec/fixtures/phosphorus.csv", Array.new, nil)
    begin
      thread = handler.import!
      thread.join
    rescue Gemdata::TransactionHasErrors => e
      # that's ok by me
    ensure
      curve = handler.phosphorus_curve

      expect(curve).to_not be_nil

      expect(curve.first_standard_0).to eq(0.005)
      expect(curve.second_standard_0).to eq(0.016)
      expect(curve.absorbance_0).to eq(0.016)
      expect(curve.concentration_0).to eq(0)

      expect(curve.first_standard_12).to eq(0.237)
      expect(curve.second_standard_12).to eq(0.239)
      expect(curve.absorbance_12).to eq(0.239)
      expect(curve.concentration_12).to eq(0.364)

    end

  end

end
