class CoarseWoodyDebrisImporter < RowImporter

  def object
    @rec
  end

  def read_row(values, logger)
    plot = find_or_create_plot(values[0])
    date = Date.strptime("#{values[1]} #{values[2]} #{values[3]}", "%Y %m %d")
    cwd_transect = find_or_create_cwd_transect(plot, values)
    cwd_sub_transect = find_or_create_cwd_sub_transect(cwd_transect, values)
    @rec = find_or_new({
      cwd_sub_transect: cwd_sub_transect,
      date:             date,
      cwd_num:          values[9],
      size_class:       values[10],
      decay_class:      values[11],
      diameter_1_cm:    nil_if_na(values[12]),
      diameter_2_cm:    nil_if_na(values[13]),
      length_cm:        nil_if_na(values[14]),
      dry_weight_g:     nil_if_na(values[15]),
      quality_code:     values[16],
      comments:         values[17]
    })
    attempt_to_overwrite!(@rec)
    save_with_status!
  end

  private

    def self.ar_class
      CoarseWoodyDebrisValue
    end

    def find_or_create_cwd_transect(plot, values)
      find_or_create(CwdTransect,
        plot: plot,
        transect_num: values[4]
      )
    end

    def find_or_create_cwd_sub_transect(cwd_transect, values)
      find_or_create(CwdSubTransect,
        cwd_transect: cwd_transect,
        sub_transect_num:         values[5],
        sub_transect_area_m2:     values[6],
        sub_transect_start_point: values[7],
        sub_transect_end_point:   values[8]
      )
    end

end