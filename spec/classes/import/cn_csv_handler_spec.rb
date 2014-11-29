require 'spec_helper'
require 'exceptions'

class FakeImporter < RowImporter

  attr_writer :cn_curve

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

describe CnCsvHandler do

  it 'can do an import with a cn_curve' do

    tree = set_up_tree('SPD01', 'T541')

    handler = CnCsvHandler.new(FakeImporter, "#{Rails.root}/spec/fixtures/cn.csv", Array.new, nil)
    begin
      thread = handler.import!
      thread.join
    rescue Gemdata::TransactionHasErrors => e
      # that's ok by me
    ensure
      cn_curve = handler.cn_curve

      expect(cn_curve).to_not be_nil

      expect(cn_curve.c_enr_1).to eq(-29.35)
      expect(cn_curve.c_enr_2).to eq(-29.27)

      expect(cn_curve.n_enr_1).to eq(-2.16)
      expect(cn_curve.c_percent_1).to eq(71.11)
      expect(cn_curve.n_percent_1).to eq(10.37)
      expect(cn_curve.cn_ratio_1).to eq(6.85)
    end

  end

end
