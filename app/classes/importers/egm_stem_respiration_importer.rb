# 
# CSV file columns in corect order - from 'validations_userdescriptions.txt' file
# 
#  Not Null (X)
# 
#  0   X  plot_code            character string, format: WAY-01. This needs to be the ForestPlots code
#  1      sub_plot             numeric, 1 =< x
#  2   X  tree_tag             integer, 1 =< x =< 9000
#  3      collar_number        numeric, x >= 1
#  4   X  replica              numeric, 1 =< x
#  5   X  year                 numeric, 1950 =< x =< 3000
#  6   X  egm_measurement      numeric, 1 =< x =< 1000
#  7      recno                numeric, 1 =< x =< 1000
#  8   X  day                  numeric, 1 =< x =< 31
#  9   X  month                numeric, 1 =< x =< 12
#  10  X  hour                 numeric, 1 =< x =< 12
#  11  X  min                  numeric, 0 =< x =< 60
#  12  X  co2ref_ppm           numeric, 100 =< x =< 900
#  13     InputD               numeric, 0 =< x =< 1000
#  14     time                 numeric, 0 =< x =< 1000
#  15     InputF               numeric, -10 =< x =< 10
#  16     atmp_mb              numeric, 400 =< x =< 2000
#  17     probe_type           numeric, 1 =< x
#  18     quality_code         character string, codes: good, not_sure, do_not_use
#  19     comments             character string
#
class EgmStemRespirationImporter < EgmRespirationImporter

  # Start of the replica etc rows
  RST = 4

  def self.table_human_name
    "EGM Stem Respiration"
  end

  def read_row(values, logger)
    @values = values
    @rec = find_or_new({
      respiration_value_type: EgmRespirationValue::Type::STEM,
      plot:                   plot,
      sub_plot:               get_sub_plot,
      egm_respiration_collar: get_respiration_collar(EgmRespirationCollar::Type::STEM),
      ingrowth_core:          ingrowth_core,
      cwd_transect:           cwd_transect,
      cwd_sub_transect:       cwd_sub_transect,
      cwd_num:                cwd_num,
      datetime:               datetime,
      treatment_code:         nil,
      disturbance_code:       nil,
      litter_code:            nil,
      replica:                values[RST],
      egm_measurement:        values[RST + 2],
      recno:                  values[RST + 3],
      co2ref_ppm:             values[RST + 8],
      inputd:                 values[RST + 9],
      time:                   values[RST + 10],
      inputf:                 values[RST + 11],
      atmp_mb:                values[RST + 12],
      probe_type:             values[RST + 13],
      quality_code:           quality_code,
      comments:               values[RST + 15]
    })
    attempt_to_overwrite!(@rec)
    save_with_status!
  end
  
  private
  
    def plot_code
      nil_if_blank_or_na(@values[0])
    end

    def sub_plot_code
      nil_if_blank_or_na(@values[1])
    end

    def plot_corner_code
      nil
    end
    
    def tree_tag
      nil_if_blank_or_na(@values[2])
    end

    def collar_num
      nil_if_blank_or_na(@values[3])
    end
    
    def cwd_transect_num
      nil
    end
    
    def cwd_sub_transect
      nil
    end

    def cwd_num
      nil
    end

    def ingrowth_core_num
      nil
    end

    def quality_code
      nil_if_blank_or_na(@values[RST + 14])
    end

    def datetime
      dt_string = "#{@values[RST + 1]}-#{@values[RST + 5]}-#{@values[RST + 4]} #{@values[RST + 6]}:#{@values[RST + 7]}:00 UTC"
      Time.strptime(dt_string, "%Y-%m-%d %H:%M:%S %Z")
    rescue Exception => ex
      raise "dt_string: #{dt_string} - #{ex.message}"
    end
  
end
