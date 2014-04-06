require 'csv'

class WoodDensity < ActiveRecord::Base
  belongs_to :branch

  attr_reader :branch, :date, :evaluator, :branch_number, :volume


  validates :branch, presence: true
  validates :date, presence: true
  validates :evaluator, presence: true
  validates :volume, presence: true, numericality: {greater_than: 0}

  validates :branch_number, presence: true, format: {
    with: /[SC]C[123]/, message: 'Should be SC or CC followed by 1, 2 or 3'
  }

  def code=(code)
    self.branch = CodeReader.new(code).find_or_create_branch
  end

  def read_csv(line)
    values = CSV.parse_line(line)
    self.date = Date.strptime(values[1], "%d/%m/%Y")
    self.evaluator = values[2]
    self.code = values[3]
    self.branch_number = values[4]
    self.volume = values[5].to_f unless values[5].nil?
  end

  private
  attr_writer :branch, :date, :evaluator, :branch_number, :volume

end
