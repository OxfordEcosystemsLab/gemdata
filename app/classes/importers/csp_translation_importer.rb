class CspTranslationImporter < RowImporter

  def object
    @ct
  end

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
    tree_code = CodeReader.tidy_tree_code(values[9])
    @ct.tree_code = tree_code
    habit = habit.gsub(/\s/, '').downcase
    branch_code = case habit
      when 'tree'
        'B1S'
      when 'tree,shade'
        'B11H'
      when 'liana'
        '' # a liana is a tree on it's own???
      else
        raise "invalid habit #{habit}"
    end
    @ct.branch_code = branch_code
    plot_code = CodeReader.tidy_plot_code(values[11])
    @ct.site = plot_code
    status = save_with_status!
    if (status != Lookup::ImportStatus.failed) and tree_code.match(/^I.*$/) then
      # create tree and (if necessary) sub plot for all I99999 trees
      plot = find_plot(plot_code)
      sub_plot = find_or_create(SubPlot, :plot_id => plot.id, :sub_plot_code => 'I')
      tree = find_or_create(Tree, :sub_plot_id => sub_plot.id, :tree_code => tree_code)
      tree.gem_tree = false
      saved = tree.save!
      if saved and not branch_code.empty? then
        branch = find_or_create(Branch, :code => branch_code, :tree_id => tree.id)
        saved = branch.save!
      end
      if not saved then
        status = Lookup::ImportStatus.failed
      end
    end
    
    status
  end

  private

    def self.ar_class
      CspTranslation
    end

end
