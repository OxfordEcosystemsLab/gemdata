class BranchLeafMassImporter < RowImporter

  def object
    @blm
  end

  def read_row(values, logger)
    @blm = find_or_new({
      :branch => find_or_create_branch(values[2])
    })
    attempt_to_overwrite!(@blm)
    @blm.person = values[0]
    @blm.date = Date.strptime(values[1], "%Y-%m-%d")
    @blm.original_branchcode = values[3]
    @blm.leaf_weight = values[4] unless values[4].upcase == 'NA'
    @blm.leaf_rachis_weight = values[5] unless values[5].upcase == 'NA'
    @blm.quality_flag = values[6]
    @blm.comments = values[7]
    save_with_status!
  end

  private

    def zero_if_base(value)
      value == 'Base' ? 0 : value
    end

    def self.ar_class
      BranchLeafMass
    end

end
