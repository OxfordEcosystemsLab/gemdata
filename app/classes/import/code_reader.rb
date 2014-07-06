require 'exceptions'

class CodeReader

  attr_reader :plot_code, :tree_code, :branch_code, :suffix

  def initialize(code)
    format = /^(\w+\d+)-((?:CSP\d+-\d+|\w\d+))[-\s](\w+\d*\w*)-?(.*)$/
    match = code.match(format) 
    if (match)
      @plot_code   = match[1]
      @tree_code   = match[2]
      @branch_code = match[3]
      @suffix      = match[4]
    else
      raise("Could not extract branch code for #{code}")
    end
  end

  def find_or_create_branch

    plot = Plot.where(:plot_code => plot_code).first

    if plot.nil?
      raise Gemdata::PlotNotFound, "Plot with code '#{plot_code}' does not exist"
    end

    tree = Tree.where(:tree_code => tree_code).includes(:sub_plot).where('sub_plots.plot_id' => plot.id).first

    if tree.nil?
      raise Gemdata::TreeNotFound, "Tree with code '#{tree_code}' does not exist in plot #{plot_code}"
    end

    Branch.where(:code => branch_code, :tree_id => tree.id).first_or_create!
  end
end
