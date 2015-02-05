class CspTranslationImporter < RowImporter

  def object
    @ct
  end

  #############################################################################
  #
  # This is a bit of a horrible botch up.
  # For example, you could very well ask "where are the rspec tests?"
  # and I would hide my head in shame. But, if you bear in mind, that this
  # importer is only going to be run ONCE on a, pretty much, static CSV
  # then you could see it in your heart to let me off my slip-shod attitude
  #
  #############################################################################

  def read_row(values, logger)
    @ct = CspTranslation.new
    @ct.csp_code = values[0]
    @ct.genus = values[1]
    @ct.species = values[2]
    @ct.full_name = values[3]
    @ct.family = values[4]
    @ct.taxon_info = values[5]
    @ct.date_collected = Date.strptime(values[6], "%d/%m/%Y")
    habit = values[7]
    @ct.habit = habit
    @ct.sun = values[8]
    tree_code = values[9].upcase.gsub(/-/, '')
    # if it's just a number, put a "T" on front so that all tree codes
    # are either I99999 to T99999999
    if tree_code.match(/^\d.*$/) then
      tree_code = "T#{tree_code}"
    end
    if not tree_code.match(/[TI]\d+[\d\.A]*/) then
      raise "invalid tree_code #{tree_code}"
    end
    @ct.tree_code = tree_code
    habit = habit.gsub(/\s/, '').downcase
    @ct.branch_code = case habit
      when 'tree'
        'B1S'
      when 'tree,shade'
        'B11H'
      when 'liana'
        '' # a liana is a tree on it's own???
      else
        raise "invalid habit #{habit}"
    end
    @ct.site = values[11]
    save_with_status!
  end

  private

    def self.ar_class
      CspTranslation
    end

end
