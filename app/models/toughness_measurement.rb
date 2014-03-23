class ToughnessMeasurement < ActiveRecord::Base

  include CSVImportTable

  attr_accessor :code

  validates :plot_code,   presence: true
  validates :tree_code,   presence: true
  validates :branch_code, presence: true
  validates :date,        presence: true
  validates :evaluator,   presence: true
  validates :replica,     presence: true
  validates :thickness,   presence: true
  validates :width,       presence: true
  validates :lines,       presence: true
  validates :punch,       presence: true

  def self.unique_key_columns
    [:plot_code, :tree_code, :branch_code, :date]
  end

  before_validation(:on => :create) do
    begin
      @branch_code = extract_branch_code
      @tree_code   = extract_tree_code
      @plot_code   = extract_plot_code
    rescue => e
      @errors.add(:code, e.message)
      puts e.message
      return false
    end

    @plot   = Plot.where(:code => @plot_code).first_or_create
    @tree   = Tree.where(:code => @tree_code, :plot_id => @plot.id)
    @branch = Branch.where(:code => @branch_code, :tree_id => @tree.id).first_or_create
  end

  private

    def extract_plot_code
      extract_match(1)
    end

    def extract_tree_code
      extract_match(2)
    end

    def extract_branch_code
      extract_match(3)
    end

    def extract_match(i)
      code_format = /^(WAY.+)-([IT]|CSP.+)-(B.+)$/
      @match ||= @code.match(code_format)
      if (@match)
        return @match[i]
      else
        raise("Could not extract branch code for #{@code}")
      end
    end

end
