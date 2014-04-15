require 'csv'

class ForestPlotsImporter

  def get_object
    @tree
  end

  def initialize
    @tree = TraitsTree.new
  end

  def read_csv(line)
    values = CSV.parse_line(line)

    @tree.fp_id = values[10]
    @tree.code = 'T' + values[19]

    @tree.plot = Plot.create(:fp_id => values[0], :plot_code => values[1])

    family = FpFamily.create(:apg_id => values[11], :name => values[12])
    genus  = FpGenus.create(:fp_id => values[13], :name => values[14], :fp_family => family)
    @tree.fp_species = FpSpecies.create(:fp_id => values[15], :name => values[16], :fp_genus => genus)
  end
end
