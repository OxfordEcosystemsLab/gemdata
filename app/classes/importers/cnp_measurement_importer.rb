class CnpMeasurementImporter < RowImporter

  def object
    @cnp
  end

  def read_row(values, logger)

    @cnp = find_or_new({
      :leaf   => find_or_create_leaf(values[4]),
      :row    => values[6],
      :column => values[7]
    })
    attempt_to_overwrite!(@cnp)

    @cnp.c_percent = values[8]
    @cnp.n_percent = values[9]
    @cnp.cn_ratio  = values[10]
    @cnp.n15_delta = values[11]
    @cnp.n13_delta = values[12]
    @cnp.cn_assays_file = values[13]
    @cnp.p_corrected_avg = values[16]
    @cnp.p_corrected_var_coef = values[17]
    @cnp.p_assays_file = values[18]
    @cnp.box_number = values[19]

    save_with_status!
  end

  private

    def self.ar_class
      CnpMeasurement
    end

end
