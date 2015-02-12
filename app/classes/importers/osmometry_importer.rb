class OsmometryImporter < RowImporter

  def object
    @o
  end

  def read_row(values, logger)

    code = values[5].gsub(/\s/, '')

    @o = find_or_new({
      :branch => find_or_create_branch(code),
      :date   => Date.strptime(values[0], "%d-%h-%y"),
      :disk_orientation => translate_orientation(values[3])
    })
    attempt_to_overwrite!(@o)

    @o.temperature = values[1]
    @o.humidity = values[2]
    @o.m1 = nil_if_zero values[6]
    @o.m2 = nil_if_zero values[7]
    @o.m3 = nil_if_zero values[8]
    @o.m4 = nil_if_zero values[9]
    @o.m5 = nil_if_zero values[10]
    @o.m6 = nil_if_zero values[11]
    @o.m7 = nil_if_zero values[12]
    @o.m8 = nil_if_zero values[13]
    @o.m9 = nil_if_zero values[14]
    @o.m10 = nil_if_zero values[15]
    @o.observations = values[16]

    save_with_status!
  end

  private

    def translate_orientation(spanish)
      if spanish.downcase == 'haz' then
        'top'
      elsif spanish.downcase == 'enves' then
        'bottom'
      else
        spanish
      end
    end

    #def zero_if_base(value)
    #  value == 'Base' ? 0 : value
    #end

    def self.ar_class
      Osmometry
    end

end
