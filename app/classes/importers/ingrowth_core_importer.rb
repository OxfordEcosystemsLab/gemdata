class IngrowthCoreImporter < RowImporter

  def object
    @rec
  end

  def read_row(values, logger)
    plot = find_or_create_plot(values[0])
    date = Date.strptime("#{values[1]} #{values[2]} #{values[3]}", "%Y %m %d")
    ingrowth_core = find_or_create_ingrowth_core(plot, values[4])
    @rec = find_or_new({
      ingrowth_core:              ingrowth_core,
      date:                       date,
      is_stock_yn:                values[5],
      ingrowth_core_litterfall_g: nil_if_na(values[6]),
      soil_humidity_pcnt:         nil_if_na(values[7]),
      soil_temperature_c:         nil_if_na(values[8]),
      time_step:                  nil_if_na(values[9]),
      time_step_minutes:          nil_if_na(values[10]),
      ol_under_2mm_g:             nil_if_na(values[11]),
      ml_under_2mm_g:             nil_if_na(values[12]),
      quality_code:               values[13],
      comments:                   values[14]
    })
    attempt_to_overwrite!(@rec)
    save_with_status!
  end

  private

    def self.ar_class
      IngrowthCoreValue
    end

end
