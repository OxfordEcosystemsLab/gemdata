require 'csv'

class BranchArchitecture < ActiveRecord::Base
  belongs_to :branch

  attr_reader :branch, :date, :evaluator, :section, :parent, :tip, :diam_inf, :diam_sup, :longitudes, :comments

  validates :branch,    presence: true
  validates :date,      presence: true
  validates :evaluator, presence: true
  validates :section,   presence: true
  validates :parent,    presence: true
  validates :tip,       presence: true

  validates_each :diam_inf, :diam_sup, :longitudes do |record, attr, value|
    if (record.tip == 'N' && value)
      record.errors.add(attr, 'Cannot be defined for "Node" tips')
    end
  end

  def code=(code)
    branch = CodeReader.new(code).find_or_create_branch
    write_attribute(:branch_id, branch.id)
  end

  def read_csv(line)
    values = CSV.parse_line(line)
    write_attribute(:date,      Date.strptime(values[1], "%d/%m/%Y"))
    write_attribute(:evaluator, values[2])
    self.code = values[3]
    write_attribute(:section,   values[5])
    write_attribute(:parent,    values[6] == 'Base' ? 0 : values[6])
    write_attribute(:tip,       values[7])
    write_attribute(:diam_inf,  values[8])
    write_attribute(:diam_sup,  values[9])
    write_attribute(:longitude, values[10])
    write_attribute(:comments,  values[11])
  end
end
