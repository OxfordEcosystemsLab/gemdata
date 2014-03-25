class ToughnessMeasurement < ActiveRecord::Base


  validates :branch_id,   presence: true
  validates :date,        presence: true
  validates :evaluator,   presence: true
  validates :replica,     presence: true
  validates :thickness,   presence: true
  validates :width,       presence: true
  validates :lines,       presence: true
  validates :punch,       presence: true

  def code=(code)
    branch_code = extract_branch_code(code)
    tree_code   = extract_tree_code(code)
    plot_code   = extract_plot_code(code)

    plot   = Plot.where(:plot_code => plot_code).first_or_create
    tree   = TraitsTree.where(:code => tree_code, :plot_id => plot.id).first_or_create
    branch = Branch.where(:code => branch_code, :traits_tree_id => tree.id).first_or_create
    write_attribute(:branch_id, branch.id)

  end

  private

    def extract_plot_code(code)
      extract_match(code, 1)
    end

    def extract_tree_code(code)
      extract_match(code, 2)
    end

    def extract_branch_code(code)
      extract_match(code, 3)
    end

    def extract_match(code, i)
      code_format = /^(WAY\d+)-((?:[IT]|CSP)\d+)-(B\d.*)$/
      @match ||= code.match(code_format)
      if (@match)
        return @match[i]
      else
        raise("Could not extract branch code for #{code}")
      end
    end

end
