class UscWaxImporter < RowImporter

  def object
    @wi
  end

  def read_row(values, logger)

    @wi = find_or_new({
      :branch => find_or_create_branch(values[1]),
     
    })
    attempt_to_overwrite!(@wi)

    @wi.sun_shade = values[2]
    @wi.uscname = values[3]
    @wi.weight = values[4]
    @wi.d_18o_lw = values[5]
    @wi.dD_lw = values[6]
    @wi.punch = values[8]

    save_with_status!
  end

  private

    def self.ar_class
      Wax Measurement
    end

end