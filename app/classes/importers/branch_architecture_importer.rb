class BranchArchitectureImporter < RowImporter

  def object
    @ba
  end

  def read_row(values, logger)
    @ba = BranchArchitecture.new
    @ba.date = Date.strptime(values[1], "%d/%m/%Y")
    @ba.evaluator = values[2]
    @ba.code = values[3]
    @ba.section = values[5]
    @ba.parent = zero_if_base(values[6])
    @ba.tip = values[7]
    @ba.diam_inf = nil_if_zero(values[8])
    @ba.diam_sup = nil_if_zero(values[9])
    @ba.longitude = nil_if_zero(values[10])
    @ba.comments = values[11]

    if @ba.save
      status = Lookup::ImportStatus.inserted
    else
      status = Lookup::ImportStatus.failed
    end

    return status
  end

  private
    def zero_if_base(value)
      value == 'Base' ? 0 : value
    end

    def is_nil_value(value)
      value.nil? || value.to_f == 0 || value == '-'
    end

    def nil_if_zero(value)
      return value unless is_nil_value(value)
    end
end
