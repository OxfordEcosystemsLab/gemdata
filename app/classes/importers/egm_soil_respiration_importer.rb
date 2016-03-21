# 
# CSV file columns in corect order - from 'validations_userdescriptions.txt' file
# 
#  Not Null (X)
# 
#  0   X  plot_code                      character string, format: WAY-01. This needs to be the ForestPlots code.
#  1      sub_plot                       numeric 1 =< x
#  2      plot_corner_code               format: N,N where N is 0 to 5. [for partitioning only] 
#  3      collar_number                  numeric x >= 1 
#  4   X  measurement_code               character string, codes: CTRL = control, PART = partitioning experiment, TOT = total soil respiration
#  5   \  treatment_code_partitionning   required when the measurement_code is PART, codes: con_nor_lit  = control & normal litterfall
#                                                                                           con_no_lit   = control & no litterfall
#                                                                                           con_doub_lit = control & double litterfall
#                                                                                           my_nor_lit  = mycorrhizae & normal litterfall
#                                                                                           my_no_lit = mycorrhizae & no litterfall
#                                                                                           my_doub_lit = mycorrhizae & double litterfall
#                                                                                           so_nor_lit = soil & normal litterfall
#                                                                                           so_no_lit = soil & no litterfall
#                                                                                           so_doub_lit = soil & double litterfall
#  6   \  disturbance_code_control       required when the measurement_code is CTRL, character string, codes: N = not disturbed, Y = disturbed.
#  7   \  litter_code                    required when the measurement_code is IC or PART, code: normal = normal litter, none = no litter, double = double litter.      
#  8   X  replica                        numeric,  1 =< x
#  9      year                           numeric, 1950 =< x =< 3000
#  10     egm_measurement                numeric, 1 =< x =< 1000
#  11     recno                          numeric, 1 =< x =< 1000
#  12     day                            numeric, 1 =< x =< 31
#  13     month                          numeric, 1 =< x =< 12
#  14     hour                           numeric, 1 =< x =< 12
#  15     min                            numeric, 0 =< x =< 60
#  16     co2ref_ppm_sec                 numeric, 100 =< x =< 900
#  17     InputD                         numeric, 0 =< x =< 1000
#  18     time                           numeric, 0 =< x =< 1000
#  19     InputF                         numeric, -10 =< x =< 10
#  20     atmp_mb                        numeric, 400 =< x =< 2000
#  21     probe_type                     numeric, 1 =< x
#  22     manually_collected_final_flux_ppm_sec
#  23     quality_code                   character string, codes: good, not_sure, do_not_use
#  24     comments                       character string
# 
class EgmSoilRespirationImporter < EgmRespirationImporter
  
  # Start of the replica etc rows
  RST = 8

  def self.table_human_name
    "EGM Soil Respiration"
  end
  
  def read_row(values, logger)
    @values = values
    @rec = find_or_new({
      respiration_value_type: EgmRespirationValue::Type::SOIL,
      plot:                   plot,
      sub_plot:               get_sub_plot,
      egm_respiration_collar: get_respiration_collar(EgmRespirationCollar::Type::SOIL),
      ingrowth_core:          ingrowth_core,
      cwd_transect:           cwd_transect,
      cwd_num:                cwd_num,
      datetime:               datetime,
      measurement_code:       values[4],
      treatment_code:         values[5],
      disturbance_code:       values[6],
      litter_code:            values[7],
      replica:                values[RST],
      egm_measurement:        egm_measurement,
      recno:                  values[RST + 3],
      co2ref_ppm:             values[RST + 8],
      inputd:                 inputd,
      time:                   values[RST + 10],
      inputf:                 values[RST + 11],
      atmp_mb:                values[RST + 12],
      probe_type:             values[RST + 13],
      quality_code:           quality_code,
      comments:               values[RST + 16]
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
      nil_if_blank_or_na(@values[2])
    end

    def tree_tag
      nil
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
    
    def egm_measurement
      nil_if_blank_or_na(@values[RST + 2])
    end
    
    def inputd
      nil_if_blank_or_na(@values[RST + 9])
    end
    
    def manually_collected_final_flux_ppm_sec
      nil_if_blank_or_na(@values[RST + 14])
    end
    
    def quality_code
      nil_if_blank_or_na(@values[RST + 15])
    end

    def datetime
      dt_string = "#{@values[RST + 1]}-#{@values[RST + 5]}-#{@values[RST + 4]} #{@values[RST + 6]}:#{@values[RST + 7]}:00 UTC"
      Time.strptime(dt_string.gsub('NA','00'), "%Y-%m-%d %H:%M:%S %Z")
    rescue Exception => ex
      raise "dt_string: #{dt_string} - #{ex.message}"
    end
  
end
