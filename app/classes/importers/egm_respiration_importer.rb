class EgmRespirationImporter < RowImporter

  def object
    @rec
  end
  
  private

    def self.ar_class
      EgmRespirationValue
    end
    
    def plot
      @plot ||= find_or_create_plot(plot_code)
    end

    def get_sub_plot
      if sub_plot_code.present?
        find_or_create(SubPlot,
          plot: plot,
          sub_plot_code: sub_plot_code
        )
      end
    end

    def get_respiration_collar(collar_type)
      collar = find_or_new(EgmRespirationCollar,
        plot: plot,
        collar_num: collar_num,
        collar_type: collar_type
      )
      collar.sub_plot = get_sub_plot
      collar.plot_corner_code = plot_corner_code
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
    
    def ingrowth_core
      if ingrowth_core_num.present?
        find_or_create_ingrowth_core(plot, ingrowth_core_num)
      end
    end
    
    def cwd_transect
      if cwd_transect_num.present?
        find_or_create_cwd_transect(plot, cwd_transect_num)
      end
    end

end
