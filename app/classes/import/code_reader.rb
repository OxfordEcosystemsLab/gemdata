require 'exceptions'

class CodeReader

  attr_reader :plot_code, :tree_code, :branch_code, :suffix

  def initialize(code)
    format = /^(\w+\d+)-((?:CSP\d+-\d+|\w\d+))(?:[-\s](\w+\d*\w*)-?(.*))?$/
    match = code.match(format) 
    if (match)
      @plot_code   = match[1].upcase
      @tree_code   = match[2]
      @branch_code = match[3]
      @suffix      = match[4]
    else
      raise Gemdata::CodeUnreadable, "Could not read code #{code}"
    end
  end
end
