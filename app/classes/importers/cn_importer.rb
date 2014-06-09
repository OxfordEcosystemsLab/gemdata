class CnImporter < BaseImporter

  attr_writer :cn_curve

  def object
    @cn
  end

  def read_row(values, logger)
    @cn = CnMeasurement.new
    @cn.cn_curve = @cn_curve

    @cn.code = values[1]
    @cn.row = values[3]
    @cn.column = values[4]
    @cn.c_percent = values[5]
    @cn.n_percent = values[6]
    @cn.cn_ratio = values[7]
    @cn.n15_delta = values[9]
    @cn.c13_delta = values[10]

    if @cn.save!
      status = Lookup::ImportStatus.inserted
    else
      status = Lookup::ImportStatus.failed
    end

    return status
  end

end
