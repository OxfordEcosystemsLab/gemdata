class LightHangingImporter < RowImporter

  def object
    @lh
  end

  def read_row(values, logger)

    @lh = find_or_new({
      :tree => find_tree(values[2]),
      :start =>  Time.strptime(values[10] + ' UTC', "%Y-%m-%d %H:%M:%S %Z")
    })
    attempt_to_overwrite!(@lh)
    @lh.last_sensor = values[3]
    @lh.last_sensor_height = values[4]
    @lh.first_sensor_to_crown_top = values[5]
    @lh.az = values[6]
    @lh.vd = values[7]
    @lh.hd = values[8]
    @lh.note = values[9]
    @lh.finish = Time.strptime(values[11] + ' UTC', "%Y-%m-%d %H:%M:%S %Z") unless values[11] == 'NA'
    save_with_status!
  end

  private

    def self.ar_class
      LightHanging
    end

end
