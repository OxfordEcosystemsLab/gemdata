class WeatherReadingImporter < RowImporter

  def object
    @wr
  end

  def read_row(values, logger)

    @wr = find_or_new({
      :plot => find_or_create(Plot, :plot_code => CodeReader.tidy_plot_code(values[1])),
      :datetime => Time.strptime(values[7], '%Y-%m-%d %H:%M:%S')
    })
    attempt_to_overwrite!(@wr)

    @wr.clouds = values[2]
    @wr.light = values[3]
    @wr.rain = values[4]
    @wr.note = values[5]
    @wr.second_note = values[6]

    save_with_status!
  end

  private

    def self.ar_class
      WeatherReading
    end

end
