class PhotosynthesisCurveImporter < RowImporter

  def object
    @pc
  end

  def read_row(values, logger)
    @pc = find_or_new({
      :leaf_part => find_or_create_leaf_part(values[1]),
      :data_type => values[5],
      :reading => values[6]
    })
    attempt_to_overwrite!(@pc)
    @pc.filename = values[0]
    @pc.code = values[1]
    @pc.comment = values[2] unless values[2] == 'NA'
    @pc.quality_flag = values[3]
    @pc.area_corr = values[4] unless values[4] == 'NA'
    # :data_type => values[5] (key)
    # :reading => values[6] (key)
    @pc.date = Date.strptime(values[7], "%d/%m/%Y")
    if values[8] != 'NA' then
      # strip a redundent date 
      time = values[8].gsub(/\d+[\/-]\d+[\/-]\d+\s/, '')
      @pc.time = Time.strptime(time, "%H:%M:%S")
    end
    @pc.photosynthesis = values[9]
    @pc.photosynthesis_std = values[10]
    @pc.conductance = values[11]
    @pc.conductance_std = values[12]
    @pc.internal_co2 = values[13]
    @pc.transpiration = values[14]
    @pc.vpd = values[15]
    @pc.air_temp = values[16]
    @pc.leaf_temp = values[17]
    @pc.co2_reference = values[18]
    @pc.co2_sample = values[19]
    @pc.water_reference = values[20]
    @pc.water_sample = values[21]
    @pc.rh_reference = values[22]
    @pc.rh_sample = values[23]
    @pc.par_in = values[24]
    @pc.pressure = values[25]
    save_with_status!
  end

  private

    def self.ar_class
      PhotosynthesisCurve
    end

end
