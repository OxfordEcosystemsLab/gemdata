class ForestPlotsImporter < RowImporter

  attr_writer :batch_id
  attr_writer :overwrite_batch_id

  def initialize
    super
    @plots_cache = Hash.new
    @sub_plots_cache = Hash.new
  end

  def object
    @tree
  end

  def self.table_human_name
    "Forest plots"
  end

  def read_row(values, logger)

    plot_code = strip_dashes(values[1])

    plot = @plots_cache[plot_code]

    if plot.nil?
      plot = Plot.find_or_initialize_by(
        :fp_id => values[0],
        :plot_code => plot_code,
      )
      plot.plot_desc = values[2]
      plot.save!

      @plots_cache[plot_code] = plot
    end

    sub_plot = @sub_plots_cache[plot.id]

    if sub_plot.nil?
      sub_plot = SubPlot.find_or_create_by!(:plot_id => plot.id)
      @sub_plots_cache[plot.id] = sub_plot
    end

    tree_code = 'T' + values[19]
    fp_id     = values[10]

    @tree = first_or_new_tree(fp_id, tree_code, sub_plot, @overwrite_batch_id)

    if @tree.batch.nil?
      @tree.batch_id = @batch_id
    end

    family = FpFamily.find_or_create_by!(:apg_id => values[11], :name => values[12])
    genus  = FpGenus.find_or_create_by!(:fp_id => values[13], :name => values[14], :fp_family => family)
    @tree.fp_species = FpSpecies.find_or_create_by!(:fp_id => values[15], :name => values[16], :fp_genus => genus)

    new_record = @tree.new_record?
    changed    = @tree.changed?

    begin
      @status = nil
      # Stop postgres from deciding that the world has ended
      Tree.transaction(requires_new: true) do
        @status = save_with_status!
      end
    rescue ActiveRecord::RecordNotUnique => e
      existing_tree = Tree.where(tree_code: tree_code, sub_plot: sub_plot).first
      @tree.tree_code = @tree.tree_code.gsub('T', 'DUP')
      error_message = %[Trying to import a duplicate tree code for #{tree_code} in plot #{plot_code}
New fp id is #{@tree.fp_id} vs existing fp id #{existing_tree.fp_id}
Saving with tree code #{@tree.tree_code}]
      logger.error error_message

      dup_tree = first_or_new_tree(fp_id, @tree.tree_code, sub_plot, @overwrite_batch_id)
      dup_tree.batch_id   = @tree.batch_id
      dup_tree.fp_species = @tree.fp_species
      @tree = dup_tree

      @status = save_with_status!
    end

    if @status != Lookup::ImportStatus.failed
      census = Census.find_or_create_by!(:mean_date => values[5], :number => values[6], :plot => plot)
      @tree.dbh_measurements.create!(:value => values[20], :census => census)
    end

    @status
  end

  private

    def strip_dashes(value)
      value.delete('-') unless value.nil?
    end

    def self.ar_class
      Tree
    end

end
