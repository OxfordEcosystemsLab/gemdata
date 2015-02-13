class LightReferenceImporter < RowImporter

  def object
    @lr
  end

  def read_row(values, logger)
    @lr = find_or_new({
      :plot => find_plot(CodeReader.tidy_plot_code(values[3])),
      :datetime => Time.strptime(values[2], '%Y-%m-%d %H:%M:%S')
    })
    attempt_to_overwrite!(@lr)
    @lr.number = values[1]
    @lr.measurement = values[4]
    @lr.photons = values[5]
    save_with_status!
  end

  private

    def self.ar_class
      LightReference
    end

end
