require 'exceptions'

class CodeReader

  attr_reader :plot_code, :tree_code, :branch_code, :leaf_code, :leaf_part, :suffix

  ##############################################################################

  def self.tidy_plot_code(raw)
    reformat = raw.upcase.match(/^(\w\w\w)[\-]?(\d\d?)$/)
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

  ##############################################################################

  def extract_plot_code(code)
    # extract the plot code from beggining and return the remainder
    match = code.upcase.match(/^(\w\w\w[\-]?\d\d?)-(.*)$/)
    if not match then
      raise Gemdata::CodeUnreadable, "Could not get plot from code [#{@full_code}]"
    end
    @plot_code = self.class.tidy_plot_code(match[1])
    match[2]
  end

  def extract_csp_code(code)
    # extract the CSP code from beggining
    # return true or false for if a match was found
    match = code.match(/^(CSP-?\d\d\d\d\d)-(.*)$/)
    if match then
      csp_translation = CspTranslation.find_by! csp_code: match[1].gsub(/-/, '')
      @tree_code = csp_translation.tree_code
      @branch_code = csp_translation.branch_code
      @suffix = match[2]
      true      
    else
      false
    end
  end

  def extract_tree_code(code)
    # extract the tree code from beggining and return the remainder
    match = code.match(/^([TI][\.\d\w]+)-?(.*)$/)
    if not match then
      raise Gemdata::CodeUnreadable, "Could not get tree from code [#{code}] [#{@full_code}]"
    end
    @tree_code = self.class.tidy_tree_code(match[1])
    match[2]
  end

  def extract_branch_code(code)
    # extract the branch code from beggining and return the remainder
    match = code.match(/^(B\d\d?[SH]?)-?(.*)$/)
    if not match then
      raise Gemdata::CodeUnreadable, "Could not get branch from code [#{code}] [#{@full_code}]"
    end
    @branch_code = match[1]
    match[2]
  end

  def extract_leaf_code(code)
    # extract the leaf code from beggining and return the remainder
    match = code.match(/^(L\d+)((?:\w+\d*)?)-?(.*)$/)
    if not match then
      raise Gemdata::CodeUnreadable, "Could not get leaf from code [#{code}] [#{@full_code}]"
    end
    @leaf_code = match[1]
    @leaf_part = match[2]
    match[3]
  end

  ##############################################################################

  def initialize(code)
    @full_code = code.gsub('_', '-').gsub(/\s/, '')
    remainder = extract_plot_code(@full_code)
    if (not remainder.blank?) and (not extract_csp_code(remainder)) then
      remainder = extract_tree_code(remainder) unless remainder.blank?
      remainder = extract_branch_code(remainder) unless remainder.blank?
      @suffix = extract_leaf_code(remainder) unless remainder.blank?
    end
  end

end
