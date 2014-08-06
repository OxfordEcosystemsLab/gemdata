class BranchArchitectureImporter < RowImporter

  def object
    @ba
  end

  def read_row(values, logger)

    @ba = find_or_new({
      :branch => find_or_create_branch(values[3]),
      :date   => Date.strptime(values[1], "%d/%m/%Y")
    })
    @ba.evaluator = values[2]
    @ba.section = values[5]
    @ba.parent = zero_if_base(values[6])
    @ba.tip = values[7]
    @ba.diam_inf = nil_if_zero(values[8])
    @ba.diam_sup = nil_if_zero(values[9])
    @ba.longitude = nil_if_zero(values[10])
    @ba.comments = values[11]

    save_with_status!
  end

  private

    def zero_if_base(value)
      value == 'Base' ? 0 : value
    end

    def self.ar_class
      BranchArchitecture
    end

end
