# plot_code                     ANK-01
# year                          2012
# month                         7
# day                           12
# ingrowth_core_num             1
# is_stock_yn                   n
# ingrowth_core_litterfall_g    8.01
# soil_humidity_pcnt            24
# soil_temperature_c            11.3
# ol_layer_depth_cm             NA
# ml_layer_depth_cm             NA
# time_step                     1
# time_step_minutes             10
# ol_under_2mm_g                0.6
# ml_under_2mm_g                0
# ol_2to3_mm_g                  NA
# ml_2to3_mm_g                  NA
# ol_3to4_mm_g                  NA
# ml_3to4_mm_g                  NA
# ol_4to5_mm_g                  NA
# ml_4to5_mm_g                  NA
# ol_above_5mm_g                NA
# ml_above_5mm_g                NA
# quality_code                  NA
# comments                      NA

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
      ingrowth_core_litterfall_g: nil_if_blank_or_na(values[6]),
      soil_humidity_pcnt:         nil_if_blank_or_na(values[7]),
      soil_temperature_c:         nil_if_blank_or_na(values[8]),
      ol_layer_depth_cm:          nil_if_blank_or_na(values[9]),
      ml_layer_depth_cm:          nil_if_blank_or_na(values[10]),
      time_step:                  nil_if_blank_or_na(values[11]),
      time_step_minutes:          nil_if_blank_or_na(values[12]),
      ol_under_2mm_g:             nil_if_blank_or_na(values[13]),
      ml_under_2mm_g:             nil_if_blank_or_na(values[14]),
      ol_2to3_mm_g:               nil_if_blank_or_na(values[15]),
      ml_2to3_mm_g:               nil_if_blank_or_na(values[16]),
      ol_3to4_mm_g:               nil_if_blank_or_na(values[17]),
      ml_3to4_mm_g:               nil_if_blank_or_na(values[18]),
      ol_4to5_mm_g:               nil_if_blank_or_na(values[19]),
      ml_4to5_mm_g:               nil_if_blank_or_na(values[20]),
      ol_above_5mm_g:             nil_if_blank_or_na(values[21]),
      ml_above_5mm_g:             nil_if_blank_or_na(values[22]),
      quality_code:               nil_if_blank_or_na(values[23]),
      comments:                   values[24]
    })
    attempt_to_overwrite!(@rec)
    save_with_status!
  end

  private

    def self.ar_class
      IngrowthCoreValue
    end

end
