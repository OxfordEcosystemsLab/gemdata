class LightReferenceImporter < RowImporter

  def object
    @lr
  end

  def read_row(values, logger)
    @lr = find_or_new({
      :datetime => Time.strptime(values[2], '%Y-%m-%d %H:%M:%S')
    })
    attempt_to_overwrite!(@lr)

    @lr.number = values[1]
    @lr.measurement = values[3]
    @lr.photons = values[4]
    # this bit is, quite obviously, wrong
    @lr.plot_id = nil

    save_with_status!
  end

  private

    def self.ar_class
      LightReference
    end

end
