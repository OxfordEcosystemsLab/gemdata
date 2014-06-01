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
    plot = Plot.where(:plot_code => plot_code).first_or_create
    sub_plot = SubPlot.where(:plot_id => plot.id).first_or_create
    tree = Tree.where(:tree_code => tree_code, :sub_plot_id => sub_plot.id).first_or_create
    Branch.where(:code => branch_code, :tree_id => tree.id).first_or_create
  end
end
