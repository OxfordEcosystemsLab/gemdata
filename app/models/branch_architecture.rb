require 'csv'

class BranchArchitecture < ActiveRecord::Base
  belongs_to :branch

  validates :branch,    presence: true
  validates :date,      presence: true
  validates :evaluator, presence: true
  validates :section,   presence: true
  validates :parent,    presence: true
  validates :tip,       presence: true

  validates_each :diam_inf, :diam_sup, :longitude do |record, attr, value|
    if (record.tip == 'N' && value)
      record.errors.add(attr, 'cannot be defined for "Node" tips')
    elsif (record.tip != 'N' && value.nil?)
      record.errors.add(attr, 'must be defined if not a "Node" tip')
    end
  end

  def code=(code)
    reader = CodeReader.new(code)
    self.branch = reader.find_or_create_branch
  end

end
