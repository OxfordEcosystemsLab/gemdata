class PhotosynthesisMeasurementImporter < RowImporter

  def object
    @pm
  end

  def read_row(values, logger)
    @pm = find_or_new({
      #########################################################################
      #
      # The code reader is going to need to do a      CSP -> tree code lookup
      # All the data we will need to make I9999999 trees work is also in that
      # table
      #
      #########################################################################
      :leaf_part => find_or_create_leaf_part(values[1]),
      :pm_type => values[3]
    })
    attempt_to_overwrite!(@pm)

    @pm.filename = values[0]
    @pm.code = values[1]
    @pm.area_corr = values[2]
    begin
      @pm.date = Date.strptime(values[4], "%d/%m/%y")
    rescue ArgumentError
      @pm.date = nil
    end
    begin
      @pm.time = Time.strptime(values[5], "%H:%M:%S")
    rescue ArgumentError
      @pm.time = nil
    end
    @pm.photosynthesis = values[6]
    @pm.photosynthesis_std = values[7]
    @pm.conductance = values[8]
    @pm.conductance_std = values[9]
    @pm.internal_co2 = values[10]
    @pm.transpiration = values[11]
    @pm.vpd = values[12]
    @pm.air_temp = values[13]
    @pm.leaf_temp = values[14]
    @pm.co2_reference = values[15]
    @pm.co2_sample = values[16]
    @pm.water_reference = values[17]
    @pm.water_sample = values[18]
    @pm.rh_reference = values[19]
    @pm.rh_sample = values[20]
    @pm.par_in = values[21]
    @pm.pressure = values[22]

    # created_at timestamp without time zone,
	  # updated_at timestamp without time zone,
	  # batch_id integer

    save_with_status!
  end

  private

    def self.ar_class
      PhotosynthesisMeasurement
    end

end
