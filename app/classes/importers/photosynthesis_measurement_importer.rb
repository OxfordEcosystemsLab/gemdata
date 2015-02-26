class PhotosynthesisMeasurementImporter < RowImporter

  def object
    @pm
  end

  def read_row(values, logger)
    @pm = find_or_new({
      :leaf_part => find_or_create_leaf_part(values[1]),
      :pm_type => values[5]
    })
    attempt_to_overwrite!(@pm)
    @pm.filename = values[0]
    @pm.code = values[1]
    @pm.comment = values[2] unless values[2] == 'NA'
    @pm.quality_flag = values[3]
    @pm.area_corr = values[4] unless values[4] == 'NA'
    # :pm_type => values[5] (key)
    # CO2R = values[6]
    @pm.date = Date.strptime(values[7], "%Y-%m-%d")
    if values[8] != 'NA' then
      # strip a redundent date 
      time = values[8].gsub(/\d+[\/-]\d+[\/-]\d+\s/, '')
      @pm.time = Time.strptime(time, "%H:%M:%S")
    end
    @pm.photosynthesis = values[9]
    @pm.photosynthesis_std = values[10]
    @pm.conductance = values[11]
    @pm.conductance_std = values[12]
    @pm.internal_co2 = values[13]
    @pm.transpiration = values[14]
    @pm.vpd = values[15]
    @pm.air_temp = values[16]
    @pm.leaf_temp = values[17]
    @pm.co2_reference = values[18] # This should be "CO2R.1"
    @pm.co2_sample = values[19]
    @pm.water_reference = values[20]
    @pm.water_sample = values[21]
    @pm.rh_reference = values[22]
    @pm.rh_sample = values[23]
    @pm.par_in = values[24]
    @pm.pressure = values[25]
    save_with_status!
  end

  private

    def self.ar_class
      PhotosynthesisMeasurement
    end

end
