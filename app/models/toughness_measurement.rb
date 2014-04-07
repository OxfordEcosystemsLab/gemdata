require 'csv'

class ToughnessMeasurement < ActiveRecord::Base

  validates :branch_id,   presence: true
  validates :date,        presence: true
  validates :evaluator,   presence: true
  validates :replica,     presence: true
  validates :thickness,   presence: true
  validates :width,       presence: true
  validates :lines,       presence: true
  validates :punch,       presence: true

  def code=(code)
    reader = CodeReader.new(code)

    branch = reader.find_or_create_branch
    write_attribute(:branch_id, branch.id)

    @leaf_code = reader.suffix
  end

  def read_csv(line)
    values = CSV.parse_line(line)
    # values[0] is lugar
    write_attribute(:date, Date.strptime(values[1], "%d/%m/%Y"))
    write_attribute(:evaluator, values[2])
    self.code = values[3]
    write_attribute(:replica, values[4])
    write_attribute(:thickness, values[5])
    write_attribute(:width, values[6])
    write_attribute(:lines, values[7])
    write_attribute(:punch, values[8])
  end

end
