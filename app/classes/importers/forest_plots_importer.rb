require 'csv'

class ForestPlotsImporter

  def self.table_name
    Tree.to_s.tableize
  end

  def self.table_human_name
    'Forest Plots'
  end

  def self.count
    Tree.count
  end

  def self.transaction(&block)
    Tree.transaction(&block)
  end

  def self.read_row(values, logger)

    @tree = Tree.new

    @tree.fp_id = values[10]
    @tree.tree_code = 'T' + values[19]

    plot = Plot.find_or_create_by!(:fp_id => values[0], :plot_code => values[1].delete('-'))
    @tree.sub_plot = SubPlot.find_or_create_by!(:plot_id => plot.id)

    family = FpFamily.create(:apg_id => values[11], :name => values[12])
    genus  = FpGenus.create(:fp_id => values[13], :name => values[14], :fp_family => family)
    @tree.fp_species = FpSpecies.create(:fp_id => values[15], :name => values[16], :fp_genus => genus)

    if @tree.save
      status = Lookup::ImportStatus.inserted
    else
      status = Lookup::ImportStatus.failed
    end

    return ImportResult.new(@tree, status)
  end
end
