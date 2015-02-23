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
    tree_code = "T#{tree_code}" if tree_code.match(/^\d/)
    tree_code.gsub!('I.', 'I')
    if not tree_code.match(/^[TI]\d+[\d\.A]*$/) then
      raise Gemdata::CodeUnreadable, "invalid tree_code #{tree_code}"
    end
    tree_code
  end

  ##############################################################################

  def initialize(code, ar_class = '')
    @full_code = code.gsub('_', '-').gsub(/\s/, '')
    remainder = extract_plot_code(@full_code)
    if not remainder.blank? then
      csp_remainder = extract_csp_code(remainder)
      if csp_remainder == false then
        remainder = extract_tree_code(remainder)
        remainder = extract_branch_code(remainder) unless remainder.blank?
      else
        remainder = csp_remainder
      end
      @suffix = extract_leaf_code(remainder, ar_class) unless remainder.blank?
    end
  end

  ##############################################################################

  private

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
      # return the remainder... or false for if a match was found
      result = false
      #                     csp              redundent  redundent
      #                     code             tree code  branch code                      remainder
      match = code.match(/^(CSP-?\d\d\d\d\d)(?:-T?\d+)?(?:-(SHADE|SUN|H|(B\d\d?[SH]?)))?(?:(-.*)?)$/)
      if match then
        csp_code = match[1].gsub(/-/, '')
        csp_translation = CspTranslation.find_by! csp_code: csp_code
        @tree_code = csp_translation.tree_code
        @branch_code = csp_translation.branch_code
        result = match[4].blank? ? '' : match[4].gsub(/^-/, '')
      end
      result
    end

    def extract_tree_code(code)
      # extract the tree code from beggining and return the remainder
      match = code.match(/^([TI]?\d+((?:[\.\-]\d*)?)A?)-?(.*)$/)
      if not match then
        raise Gemdata::CodeUnreadable, "Could not get tree from code [#{code}] (full code: [#{@full_code}])"
      end
      @tree_code = self.class.tidy_tree_code(match[1])
      match[3]
    end

    def extract_branch_code(code)
      # extract the branch code from beggining and return the remainder
      #
      # Branch codes should be validated to only be in this range:
      # B[1-10]S  - B[11-20]H
      #
      match = code.match(/^(B\d\d?[SH]?)-?(.*)$/)
      if not match then
        raise Gemdata::CodeUnreadable, "Could not get branch from code [#{code}] (full code: [#{@full_code}])"
      end
      @branch_code = match[1]
      match[2]
    end

    def extract_leaf_code(code, ar_class)
      # extract the leaf code from beggining and return the remainder
      match = code.match(/^(L\d+)((?:\w+\d*)?)-?(.*)$/)
      if not match then
        raise Gemdata::CodeUnreadable, "Could not get leaf from code [#{code}] (full code: [#{@full_code}])"
      end
      @leaf_code = match[1]
      lpt = LeafPartTranslation.find_by(ar_class: ar_class, original_suffix: match[2])
      @leaf_part = lpt.blank? ? match[2] : (lpt.part + lpt.subsection.to_s + lpt.simple_or_compound)
      match[3]
    end

end
