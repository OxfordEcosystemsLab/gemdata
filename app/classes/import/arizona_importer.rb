require 'csv'

class ArizonaImporter

  def get_object
    @az
  end

  def initialize
    @az = Arizona.new
  end

  def read_csv(line)
    values = CSV.parse_line(line)
    @az.date = Date.strptime(values[1], "%d/%m/%Y")
    @az.evaluators = values[2]
    @az.code = values[4]
    @az.fresh_mass = values[5]
    @az.dry_mass = values[6]
    @az.thickness = values[7] unless values[7].nil?
    @az.petiole_width = values[8] unless values[8].nil?
    @az.comments = values[9]
  end

end
