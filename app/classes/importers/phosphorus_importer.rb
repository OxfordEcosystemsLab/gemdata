class PhosphorusImporter < RowImporter

  attr_writer :phosphorus_curve

  def self.handler_class
    PhosphorusCsvHandler
  end

  def object
    @p
  end

  def read_row(values, logger)

    @p = find_or_new({
      phosphorus_curve: @phosphorus_curve,
      leaf:     find_or_create_leaf(values[1]),
      row:      values[3],
      column:   values[4]
    })
    attempt_to_overwrite!(@p)

    @p.sample_mass = values[5]
    @p.sample_absorbance = values[6]
    @p.sample_concentration  = values[7]
    @p.sample_volume = values[8]
    @p.p_mass = values[9]
    @p.p_original = values[10]
    @p.corrected_std = values[14]

    save_with_status!
  end

  private

    def self.ar_class
      PhosphorusMeasurement
    end

end
