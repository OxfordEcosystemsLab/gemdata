class ForestPlotsImporter < RowImporter

  def object
    @tree
  end

  def read_row(values, logger)

    @tree = Tree.new

    @tree.fp_id = values[10]
    @tree.tree_code = 'T' + values[19]

    plot_code = strip_dashes(values[1])
    plot = Plot.find_or_initialize_by(
      :fp_id => values[0],
      :plot_code => plot_code,
    )
    plot.plot_desc = values[2]
    plot.save!

    @tree.sub_plot = SubPlot.find_or_create_by!(:plot_id => plot.id)

    family = FpFamily.find_or_create_by!(:apg_id => values[11], :name => values[12])
    genus  = FpGenus.find_or_create_by!(:fp_id => values[13], :name => values[14], :fp_family => family)
    @tree.fp_species = FpSpecies.find_or_create_by!(:fp_id => values[15], :name => values[16], :fp_genus => genus)

    if @tree.save
      status = Lookup::ImportStatus.inserted

      census = Census.find_or_create_by!(:mean_date => values[5], :number => values[6], :plot => plot)
      @tree.dbh_measurements.create!(:value => values[20], :census => census)
    else
      status = Lookup::ImportStatus.failed
    end

    return status
  end

  private
    def strip_dashes(value)
      value.delete('-')
    end

end
