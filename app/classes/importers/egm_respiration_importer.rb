class EgmRespirationImporter < RowImporter

  def object
    @rec
  end

  def read_row(values, logger)
    plot = find_or_create_plot(values[0])
    dt_string = "#{values[11]}-#{values[15]}-#{values[14]} #{values[16]}:#{values[17]}:00 UTC"
    datetime = Time.strptime(dt_string, "%Y-%m-%d %H:%M:%S %Z")
    @rec = find_or_new({
      egm_respiration_collar: get_respiration_collar(plot, values),
      ingrowth_core:          get_ingrowth_core(plot, values),
      datetime:               datetime,
      measurement_code:       values[6],
      treatment_code:         values[7],
      disturbance_code:       values[8],
      litter_code:            values[9],
      replica:                values[10],
      egm_measurement:        values[12],
      recno:                  values[13],
      co2ref_ppm:             values[18],
      inputd:                 values[19],
      time:                   values[20],
      inputf:                 values[21],
      atmp_mb:                values[22],
      probe_type:             values[23],
      quality_code:           values[24],
      comments:               values[25]
    })
    attempt_to_overwrite!(@rec)
    save_with_status!
  end

  private

    def self.ar_class
      EgmRespirationValue
    end

    def get_ingrowth_core(plot, values)
      igcore_num = nil_if_blank(values[4])
      if igcore_num.present?
        find_or_create_ingrowth_core(plot, igcore_num)
      end
    end

    def get_respiration_collar(plot, values)
      collar_num = nil_if_blank(values[5])
      tree_tag = nil_if_blank(values[3])
      if collar_num.present?
        find_or_create_egm_respiration_collar_by_collar_num(plot, values)
      elsif tree_tag.present?
        find_or_create_egm_respiration_collar_by_tree_tag(plot, values)
      end
    end

    def find_or_create_egm_respiration_collar_by_collar_num(plot, values)
      collar = find_or_new(EgmRespirationCollar,
        plot: plot,
        collar_num: nil_if_blank(values[5])
      )
      collar.sub_plot = get_sub_plot(plot, values)
      collar.plot_corner_code = nil_if_blank(values[2])
      check_no_overwrite_and_save_collar(collar)
      collar
    end

    def find_or_create_egm_respiration_collar_by_tree_tag(plot, values)
      tree = get_tree(plot, values)
      collar = find_or_new(EgmRespirationCollar,
        plot: plot,
        tree: tree
      )
      collar.sub_plot = tree.sub_plot || get_sub_plot(plot, values)
      collar.plot_corner_code = nil_if_blank(values[2])
      check_no_overwrite_and_save_collar(collar)
      collar
    end

    def check_no_overwrite_and_save_collar(collar)
      unless collar.new_record?
        raise Gemdata::NoPermissionToOverwrite if collar.sub_plot_id_changed? && !collar.sub_plot_id_was.nil?
        raise Gemdata::NoPermissionToOverwrite if collar.plot_corner_code_changed? && !collar.plot_corner_code_was.nil?
      end
      collar.save!
    end

    def get_tree(plot, values)
      tree_tag = nil_if_blank(values[3])
      sub_plot = nil_if_blank(values[1])
      if tree_tag.present?
        find_or_create_tree_from_parts(plot.plot_code, sub_plot, tree_tag)
      end
    end

    def get_sub_plot(plot, values)
      sub_plot_code = nil_if_blank(values[1])
      if sub_plot_code.present?
        find_or_create(SubPlot,
          plot: plot,
          sub_plot_code: sub_plot_code
        )
      end
    end

end

# 0    plot_code          SP1500
# 1    sub_plot           
# 2    plot_corner_code   
# 3    tree_tag           
# 4    ingrowth_core_num  
# 5    collar_number      
# 6    measurement_code   TOT
# 7    treatment_code     
# 8    disturbance_code   
# 9    litter_code        
# 10   replica            1
# 11   year               2012
# 12   egm_measurement    11
# 13   recno              5
# 14   day                25
# 15   month              1
# 16   hour               14
# 17   min                9
# 18   co2ref             446
# 19   InputD             10
# 20   time               19
# 21   InputF             0.44
# 22   atmp               853
# 23   probe_type         8
