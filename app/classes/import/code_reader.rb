require 'exceptions'

class CodeReader

  attr_reader :plot_code, :tree_code, :branch_code, :leaf_code, :suffix

  def self.tidy_plot_code(raw)
    reformat = raw.upcase.match(/^(\w\w\w)-?(\d\d?)/)
    digits = reformat[2]
    if digits.length == 1 then
      digits = "0#{digits}"
    end
    "#{reformat[1]}-#{digits}"
  end

  def self.tidy_tree_code(raw)
    tree_code = raw.upcase.gsub(/-/, '')
    # if it starts with a number, put a "T" on front so that all tree codes
    # are either I........ or T............
    if tree_code.match(/^\d.*$/) then
      tree_code = "T#{tree_code}"
    end
    if not tree_code.match(/^[TI]\d+[\d\.A]*$/) then
      raise Gemdata::CodeUnreadable, "invalid tree_code #{tree_code}"
    end
    tree_code
  end

  def initialize(code)
    format = /^(\w+-?\d+)-((?:CSP\d+-\d+|\w[\.\d\w]+))(?:[-\s](\w+\d*\w*)(?:-(\w\d+)(?:(\w\d+))?)?)?$/
    match = code.match(format)
    if (match)
      @plot_code   = self.class.tidy_plot_code(match[1])
      @tree_code   = match[2]
      @branch_code = match[3]
      @leaf_code   = match[4]
      @suffix      = match[5]
    else
      raise Gemdata::CodeUnreadable, "Could not read code [#{code}]"
    end
  end
end
