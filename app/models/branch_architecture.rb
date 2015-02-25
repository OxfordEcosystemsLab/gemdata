require 'csv'

class BranchArchitecture < ActiveRecord::Base
  include BatchImport

  belongs_to :branch
  validates :branch,    presence: true
  
  validates :section,   presence: true
  validates :parent,    presence: true
  validates :tip,       presence: true

  validates_each :diam_inf do |record, attr, value|
    if (record.tip == 'Node' and value)
      record.errors.add(attr, 'cannot be defined for "Node" tips')
    elsif (record.tip =~ /^[F|C|T]$/ and value.nil?)
      record.errors.add(attr, 'must be defined for a "F", "C" or "T" tip')
    end
  end

  validates_each :diam_sup, :longitude do |record, attr, value|
    if (record.tip == 'Node' and value)
      record.errors.add(attr, 'cannot be defined for "Node" tips')
    elsif (record.tip =~ /^[F|T]$/ and value.nil?)
      record.errors.add(attr, 'must be defined for a "F" or "T" tip')
    end
  end

end
