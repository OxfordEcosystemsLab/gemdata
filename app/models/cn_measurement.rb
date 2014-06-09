class CnMeasurement < ActiveRecord::Base
  belongs_to :cn_curve
  belongs_to :leaf

  validates :leaf, :cn_curve, :presence => true
  validates :n15_delta, :c13_delta, :numericality => { :less_than => 0 }

  def code=(code)
    reader = CodeReader.new(code)
    branch = reader.find_or_create_branch
    self.leaf = Leaf.where(:code => reader.suffix, :branch => branch).first_or_create
  end
end
