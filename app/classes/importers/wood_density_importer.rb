require 'csv'

class WoodDensityImporter

  def get_object
    @wood
  end

  def initialize
    @wood = WoodDensity.new
  end

  def self.table_human_name
    'Wood Density'
  end

  def read_csv(line)
    values = CSV.parse_line(line)
    @wood.date = Date.strptime(values[1], "%d/%m/%Y")
    @wood.evaluator = values[2]
    @wood.code = values[3]
    @wood.branch_number = values[4]
    @wood.volume = values[5].to_f unless values[5].nil?
  end

end
