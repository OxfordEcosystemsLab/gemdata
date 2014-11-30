class FineLitterfallImporter < RowImporter

  def object
    @rec
  end

  def read_row(values, logger)
    plot = find_or_create_plot(values[0])
    date = Date.strptime("#{values[1]} #{values[2]} #{values[3]}", "%Y %m %d")
    trap = find_or_create_litterfall_trap(plot, values)
    @rec = find_or_new({
      litterfall_trap:       trap,
      collection_date:       date,
      leaves_g_per_trap:     nil_if_na(values[6]),
      twigs_g_per_trap:      nil_if_na(values[7]),
      flowers_g_per_trap:    nil_if_na(values[8]),
      fruits_g_per_trap:     nil_if_na(values[9]),
      bromeliads_g_per_trap: nil_if_na(values[10]),
      epiphytes_g_per_trap:  nil_if_na(values[11]),
      other_g_per_trap:      nil_if_na(values[12]),
      palm_leaves_g:         nil_if_na(values[13]),
      palm_flower_g:         nil_if_na(values[14]),
      palm_fruit_g:          nil_if_na(values[15]),
      quality_code:          values[16],
      comments:              values[17]
    })
    attempt_to_overwrite!(@rec)
    save_with_status!
  end

  private

    def self.ar_class
      FineLitterfallValue
    end

    def find_or_create_litterfall_trap(plot, values)
      find_or_create(LitterfallTrap,
        plot: plot,
        litterfall_trap_num: values[4],
        litterfall_trap_size_m2: values[5]
      )
    end

end
