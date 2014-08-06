class CnImporter < RowImporter

  attr_writer :cn_curve

  def self.handler_class
    CnCsvHandler
  end

  def object
    @cn
  end

  def read_row(values, logger)

    @cn = find_or_new({
      cn_curve: @cn_curve,
      leaf:     find_or_create_leaf(values[1]),
      row:      values[3],
      column:   values[4]
    })
    @cn.c_percent = values[5]
    @cn.n_percent = values[6]
    @cn.cn_ratio  = values[7]
    @cn.n15_delta = values[9]
    @cn.c13_delta = values[10]

    save_with_status!
  end

  private

    def self.ar_class
      CnMeasurement
    end

end
