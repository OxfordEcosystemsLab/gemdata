class CarnegieBulkLeafChemistryImporter < RowImporter

  def object
    @cc
  end

  def read_row(values, logger)
    @cc = find_or_new({
      :csp_code => values[2]
    })
    attempt_to_overwrite!(@cc)
    @cc.flagged = values[0]
    @cc.reason = values[1]
    @cc.date_collected = Date.strptime(values[10], "%d/%m/%Y")
    tree_code = CodeReader.tidy_tree_code(values[12].gsub(/-/, '.'))
    plot_code = values[16][/\w\w\w-\d\d/]
    branch_ids = [nil, nil, nil]
    [0, 1, 2].each do |n|
      branch_code = values[13 + n]
      if branch_code then
        branch_code.strip!
        branch_code = "B#{branch_code}" unless branch_code.match(/^B/)
        branch = find_or_create_branch("#{plot_code}-#{tree_code}-#{branch_code}")
        branch_ids[n] = branch.id
      end
    end
    @cc.branch_1=branch_ids[0]
    @cc.branch_2=branch_ids[1]
    @cc.branch_3=branch_ids[2]
    @cc.n = values[25]
    @cc.chl_a = values[26]
    @cc.chl_b = values[27]
    @cc.carotenoids = values[29]
    @cc.soluble_c = values[30]
    @cc.delta_13c = values[31]
    @cc.water = values[32]
    @cc.p = values[33]
    @cc.ca = values[34]
    @cc.k = values[35]
    @cc.mg = values[36]
    @cc.lma = values[37]
    @cc.c = values[38]
    @cc.lignin = values[39]
    @cc.cellulose = values[40]
    @cc.hemi_cellulose = values[41]
    @cc.phenols = values[42]
    @cc.tannins = values[43]
    @cc.b = values[44]
    @cc.fe = values[45]
    @cc.mn = values[46]
    @cc.zn = values[47]
    save_with_status!
  end

  private

    def self.ar_class
      CarnegieBulkLeafChemistry
    end

end
