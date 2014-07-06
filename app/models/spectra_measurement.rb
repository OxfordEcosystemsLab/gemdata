class SpectraMeasurement < ActiveRecord::Base
  belongs_to :leaf

  validates :leaf, :branch, :order, :measurement_350, :presence => true
  validates :type, format: {
    with: /top_ref|top_trans|bottom_ref|bottom_trans/,
    message: "type must be one of: 'top_ref', 'top_trans', 'bottom_ref' or 'bottom_trans'"
  }

  def code=(code)
    reader = CodeReader.new(code)
    branch = reader.find_or_create_branch
    self.leaf = Leaf.where(:code => reader.suffix, :branch => branch).first_or_create
  end

end
