class CnpMeasurementImporter < RowImporter

  def object
    @cnp
  end

  def read_row(values, logger)
    # 0 Site
    # 1 Tree 
    # 2 Genus
    # 3 Species
    @cnp = find_or_new({
      :leaf_part => find_or_create_leaf_part(values[4]),
    })
    attempt_to_overwrite!(@cnp)
    @cnp.original_cn_leafcode = values[5]
    # 6 Site
    # 7 Row in tray
    # 8 Column in tray
    @cnp.c_percent = values[9]
    @cnp.c_percent_quality = values[10]
    @cnp.n_percent = values[11]
    @cnp.n_percent_quality = values[12]
    @cnp.cn_ratio  = values[13]
    @cnp.cn_ration_quality = values[14]
    @cnp.n15_delta = values[15]
    @cnp.n15_delta_quality = values[16]
    @cnp.c13_delta = values[17]
    @cnp.c13_delta_quality = values[18]
    @cnp.cn_assays_file = values[19]
    # 20 Site
    @cnp.original_P_leafcode = values[21]
    @cnp.p_corrected_percent = values[22]
    @cnp.p_corrected_percent_cv = values[23]
    @cnp.p_corrected_percent_quality = values[24]
    @cnp.p_assays_file = values[25]
    # 26 box number for P sample
    save_with_status!
  end

  private

    def self.ar_class
      CnpMeasurement
    end

end
