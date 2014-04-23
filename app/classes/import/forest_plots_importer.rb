require 'csv'

class ForestPlotsImporter

  def get_object
    @tree
  end

  def self.table_name
    TraitsTree.to_s.tableize
  end

  def self.table_human_name
    'Forest Plots'
  end

  def self.count
    TraitsTree.count
  end

  def self.transaction(&block)
    TraitsTree.transaction(&block)
  end

  def self.read_row(values, logger)

    @tree = TraitsTree.new

    @tree.fp_id = values[10]
    @tree.code = 'T' + values[19]

    @tree.plot = Plot.find_or_create_by!(:fp_id => values[0], :plot_code => values[1])

    family = FpFamily.create(:apg_id => values[11], :name => values[12])
    genus  = FpGenus.create(:fp_id => values[13], :name => values[14], :fp_family => family)
    @tree.fp_species = FpSpecies.create(:fp_id => values[15], :name => values[16], :fp_genus => genus)

    if @tree.save!
      return Lookup::ImportStatus.inserted
    else
      return Lookup::ImportStatus.failed
    end
  end
end
