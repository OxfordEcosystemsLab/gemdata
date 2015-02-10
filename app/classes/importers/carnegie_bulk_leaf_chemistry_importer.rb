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
    # you Americans with your wierd date formats!! ;)
    @cc.date_collected = Date.strptime(values[9], "%m/%d/%Y")
    # 10 - Habit - *** PRESENT IN CSV BUT NOT USED IN DATABASE ***
    tree_code = CodeReader.tidy_tree_code(values[11].gsub(/-/, '.'))
    plot_code = values[15][/\w\w\w-\d\d/]
    branch_ids = [nil, nil, nil]
    [0, 1, 2].each do |n|
      branch_code = values[12 + n]
      if branch_code then
        branch_code.strip!
        branch = find_or_create_branch("#{plot_code}-#{tree_code}-#{branch_code}")
        branch_ids[n] = branch.id
      end
    end
    @cc.branch_1=branch_ids[0]
    @cc.branch_2=branch_ids[1]
    @cc.branch_3=branch_ids[2]
    # 16 - lat - *** PRESENT IN CSV BUT NOT USED IN DATABASE ***
    # 17 - long - *** PRESENT IN CSV BUT NOT USED IN DATABASE ***
    # 18 - Elevation - *** PRESENT IN CSV BUT NOT USED IN DATABASE ***
    # 19 - soil_order - *** PRESENT IN CSV BUT NOT USED IN DATABASE ***
    # 20 - MAP - *** PRESENT IN CSV BUT NOT USED IN DATABASE ***
    # 21 - MAT - *** PRESENT IN CSV BUT NOT USED IN DATABASE ***
    @cc.n = values[22]
    @cc.chl_a = values[23]
    @cc.chl_b = values[24]
    @cc.carotenoids = values[25]
    @cc.soluble_c = values[26]
    @cc.delta_13c = values[27]
    @cc.water = values[28]
    @cc.p = values[29]
    @cc.ca = values[30]
    @cc.k = values[31]
    @cc.mg = values[32]
    @cc.lma = values[33]
    @cc.c = values[34]
    @cc.lignin = values[35]
    @cc.cellulose = values[36]
    @cc.hemi_cellulose = values[37]
    @cc.phenols = values[38]
    @cc.tannins = values[39]
    @cc.b = values[40]
    @cc.fe = values[41]
    @cc.mn = values[42]
    @cc.zn = values[43]
    # 44 - notes - *** PRESENT IN CSV BUT NOT USED IN DATABASE ***
    # 45 - field_sample_id - *** PRESENT IN CSV BUT NOT USED IN DATABASE ***
    # 46 - past_updates - *** PRESENT IN CSV BUT NOT USED IN DATABASE ***
    # 47 - taxonomic_change - *** PRESENT IN CSV BUT NOT USED IN DATABASE ***

    # created_at timestamp without time zone,
	  # updated_at timestamp without time zone,
	  # batch_id integer

    save_with_status!
  end

  private

    def self.ar_class
      CarnegieBulkLeafChemistry
    end

end
