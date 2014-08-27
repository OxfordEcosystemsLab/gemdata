class ForestPlotsImporter < RowImporter

  def initialize(batch_id, overwrite_batch_id)
    super(batch_id, overwrite_batch_id)
    @plots_cache = Hash.new
    @sub_plots_cache = Hash.new
  end

  def object
    @tree
  end

  def self.table_human_name
    "Forest plots"
  end

  def self.csv_options
    super.merge :quote_char => "\x00"
  end

  def read_row(values, logger)

    plot_code = strip_dashes(values[1])

    plot = @plots_cache[plot_code]

    if plot.nil?
      plot = find_or_create(Plot, :fp_id => values[0], :plot_code => plot_code)
      attempt_to_overwrite!(plot)
      plot.plot_desc = values[2]
      plot.save!

      @plots_cache[plot_code] = plot
    end

    sub_plot = @sub_plots_cache[plot.id]

    if sub_plot.nil?
      sub_plot = find_or_create(SubPlot, :plot_id => plot.id)
      @sub_plots_cache[plot.id] = sub_plot
    end

    @tree = find_or_new({
      :fp_id => values[10],
      :tree_code => 'T' + values[19],
      sub_plot: sub_plot
    })
    attempt_to_overwrite!(@tree)

    family  = find_or_create(FpFamily,  :apg_id => values[11], :name => values[12])
    genus   = find_or_create(FpGenus,   :fp_id  => values[13], :name => values[14], :fp_family => family)
    species = find_or_create(FpSpecies, :fp_id  => values[15], :name => values[16], :fp_genus => genus)
    @tree.fp_species = species

    begin
      @status = nil
      # Stop postgres from deciding that the world has ended
      Tree.transaction(requires_new: true) do
        @status = save_with_status!
      end
    rescue ActiveRecord::RecordNotUnique => e
      existing_tree = Tree.where(tree_code: @tree.tree_code, sub_plot: sub_plot).first
      @tree.tree_code = @tree.tree_code.gsub('T', 'DUP')
      error_message = %[Trying to import a duplicate tree code for #{@tree.tree_code} in plot #{plot_code}
New fp id is #{@tree.fp_id} vs existing fp id #{existing_tree.fp_id}
Saving with tree code #{@tree.tree_code}]
      logger.error error_message

      dup_tree = find_or_new(fp_id: @tree.fp_id, tree_code: @tree.tree_code, sub_plot: sub_plot)
      dup_tree.fp_species = @tree.fp_species
      @tree = dup_tree

      @status = save_with_status!
    end

    if @status != Lookup::ImportStatus.failed
      census = find_or_create(Census, :mean_date => values[5], :number => values[6], :plot => plot)
      dbh    = find_or_create(DbhMeasurement, :tree => @tree, :value => values[20], :census => census)
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
