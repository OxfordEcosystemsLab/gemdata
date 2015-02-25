require 'csv'

class BranchArchitecture < ActiveRecord::Base
  include BatchImport

  belongs_to :branch

  validates :branch,    presence: true
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

end
