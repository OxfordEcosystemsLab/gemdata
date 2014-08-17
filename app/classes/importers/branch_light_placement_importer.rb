class BranchLightPlacementImporter < RowImporter

  def object
    @blp
  end

  def read_row(values, logger)

    @blp = find_or_new({
      :branch => find_or_create_branch(values[1]),
      :start =>  Time.strptime(values[17] + ' UTC', "%m/%d/%Y %H:%M %Z"),
      :finish => Time.strptime(values[18] + ' UTC', "%m/%d/%Y %H:%M %Z"),
    })
    attempt_to_overwrite!(@blp)

    @blp.weather_reading = WeatherReading.find_between @blp.start, @blp.finish

    @blp.sun_shade      = values[2].upcase
    @blp.pic1           = values[3]
    @blp.pic2           = values[4]
    @blp.pic3           = values[5]
    @blp.hd_pic         = values[6]
    @blp.alt_pic        = values[7]
    @blp.angle_pic      = values[8]
    @blp.az_pic         = values[9]
    @blp.az_branch      = values[10]
    @blp.vd_branch      = values[11]
    @blp.hd_branch      = values[12]
    @blp.vground_branch = values[13]
    @blp.light_cond     = values[14]
    @blp.liana_cov      = values[15]
    @blp.note           = values[16]

    save_with_status!
  end

  private

    def self.ar_class
      BranchLightPlacement
    end

end
