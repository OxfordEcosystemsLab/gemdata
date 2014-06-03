require 'csv'

class ToughnessMeasurement < ActiveRecord::Base
  belongs_to :branch

  validates :branch,      presence: true
  validates :date,        presence: true
  validates :evaluator,   presence: true
  validates :replica,     presence: true
  validates :thickness,   presence: true
  validates :width,       presence: true
  validates :lines,       presence: true
  validates :punch,       presence: true

  validates :thickness, numericality: { :greater_than => 0 }
  validates :width, numericality: { :greater_than => 0 }
  validates :lines, numericality: { :greater_than => 0 }
  validates :punch, numericality: { :greater_than => 0 }

  def code=(code)
    reader = CodeReader.new(code)
    self.branch = reader.find_or_create_branch
  end

end
