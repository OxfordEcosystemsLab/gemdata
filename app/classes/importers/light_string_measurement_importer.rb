class LightStringMeasurementImporter < RowImporter

  def object
    @lsm
  end

  def read_row(values, logger)

    @lsm = find_or_new({
      :datetime  => Time.strptime(values[1] + ' UTC', "%Y-%m-%d %H:%M:%S %Z"),
      :record_no => values[2]
    })
    attempt_to_overwrite!(@lsm)

    @lsm.light_hanging = LightHanging.find_by_time @lsm.datetime
    @lsm.m0   = nil_if_na values[3]
    @lsm.m0_5 = nil_if_na values[4]
    @lsm.m1   = nil_if_na values[5]
    @lsm.m1_5 = nil_if_na values[6]
    @lsm.m2   = nil_if_na values[7]
    @lsm.m2_5 = nil_if_na values[8]
    @lsm.m3   = nil_if_na values[9]
    @lsm.m3_5 = nil_if_na values[10]
    @lsm.m4   = nil_if_na values[11]
    @lsm.m4_5 = nil_if_na values[12]
    @lsm.m5   = nil_if_na values[13]
    @lsm.m6   = nil_if_na values[14]
    @lsm.m7   = nil_if_na values[15]
    @lsm.m8   = nil_if_na values[16]
    @lsm.m9   = nil_if_na values[17]
    @lsm.m10  = nil_if_na values[18]
    @lsm.m11  = nil_if_na values[19]
    @lsm.m12  = nil_if_na values[20]
    @lsm.m13  = nil_if_na values[21]
    @lsm.m14  = nil_if_na values[22]
    @lsm.m15  = nil_if_na values[23]
    @lsm.m16  = nil_if_na values[24]
    @lsm.m17  = nil_if_na values[25]
    @lsm.m18  = nil_if_na values[26]
    @lsm.m19  = nil_if_na values[27]
    @lsm.m20  = nil_if_na values[28]
    @lsm.m21  = nil_if_na values[29]
    @lsm.m22  = nil_if_na values[30]
    @lsm.m23  = nil_if_na values[31]
    @lsm.m24  = nil_if_na values[32]
    @lsm.m25  = nil_if_na values[33]
    @lsm.m26  = nil_if_na values[34]

    save_with_status!
  end

  private

    def self.ar_class
      LightStringMeasurement
    end

end
