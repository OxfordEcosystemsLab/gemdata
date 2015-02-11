require 'exceptions'

class RowImporter

  def initialize(batch_id, overwrite_batch_id)
    @batch_id = batch_id
    @overwrite_batch_id = overwrite_batch_id
  end

  def self.table_name
    ar_class.to_s.tableize
  end

  def self.table_human_name
    ar_class.to_s.underscore.gsub('_',' ').capitalize
  end

  def self.count
    ar_class.count
  end

  def self.transaction(&block)
    ar_class.transaction(&block)
  end

  # expect these to be overwritten

  def self.handler_class
    BaseCsvHandler
  end

  def self.csv_options
    Hash.new
  end

  def object
    raise NoMethodError
  end

  def read_row(values, logger)
    raise NoMethodError
  end

  protected

    def save_with_status!
      is_new  = object.new_record?
      changed = object.changed?
      saved   = object.save!

      if is_new
        Lookup::ImportStatus.inserted
      elsif changed
        Lookup::ImportStatus.updated
      elsif not saved
        Lookup::ImportStatus.failed
      else
        Lookup::ImportStatus.skipped
      end
    end

    def find_or_new(ar_class = nil, unique_identifiers)
      ar_class ||= self.class.ar_class
      ar_class.batch_find_or_initialize_by(@batch_id, unique_identifiers)
    end

    def find_or_create(ar_class = nil, unique_identifiers)
      ar_class ||= self.class.ar_class
      ar_class.batch_find_or_create_by!(@batch_id, unique_identifiers)
    end

    def attempt_to_overwrite!(object)
      unless object.can_overwrite(@batch_id, @overwrite_batch_id)
        raise Gemdata::NoPermissionToOverwrite, "No permission to override #{object.class.name} from a different batch: #{object.to_json}"
      end
    end

    def is_nil_value(value)
      value.nil? || value.to_f == 0 || value == '-'
    end

    def nil_if_zero(value)
      return value unless is_nil_value(value)
    end

    def nil_if_na(value)
      value == 'NA' || value == 'NaN' ? nil : value
    end

    def nil_if_blank(value)
      value.blank? ? nil : value
    end

    def find_or_new(ar_class = nil, unique_identifiers)
      ar_class ||= self.class.ar_class
      ar_class.batch_find_or_initialize_by(@batch_id, unique_identifiers)
    end

    def find_or_create_plot(plot_code)
      find_or_create(Plot, plot_code: plot_code.upcase.strip)
    end

    def find_or_create_tree_from_parts(plot_code, sub_plot_code, tree_tag)
      plot = find_or_create_plot(plot_code)
      tree = plot.trees.where(tree_code: tree_tag).first
      if tree && tree.sub_plot.sub_plot_code != sub_plot_code
        raise Gemdata::TreeNotFound, "Tree '#{tree_tag}' found, but has subplot code miss-match: '#{tree.sub_plot.sub_plot_code}' != '#{sub_plot_code}'"
      else
        sub_plot = find_or_create(SubPlot, plot: plot, sub_plot_code: sub_plot_code)
        tree = find_or_create(Tree, sub_plot_id: sub_plot.id, tree_code: tree_tag)
      end
      tree
    end

    def find_plot(plot_code)
      plot = Plot.find_by(plot_code: plot_code)
      raise Gemdata::PlotNotFound, "Plot with code '#{plot_code}' does not exist" unless plot
      plot
    end

    def find_tree(code, reader = nil)
      reader ||= CodeReader.new(code)
      plot = find_plot(reader.plot_code)
      tree = Tree.where(:tree_code => reader.tree_code).includes(:sub_plot).where('sub_plots.plot_id' => plot.id).first
      raise Gemdata::TreeNotFound, "Tree with code '#{reader.tree_code}' does not exist in plot #{reader.plot_code}" if tree.nil?
      tree
    end

    def find_or_create_branch(code, reader = nil)
      reader ||= CodeReader.new(code)
      tree = find_tree(code, reader)
      find_or_create(Branch, :code => reader.branch_code, :tree_id => tree.id)
    end

    def find_or_create_leaf(code, reader = nil)
      reader ||= CodeReader.new(code)
      branch = find_or_create_branch(code, reader)
      find_or_create(Leaf, :code => reader.leaf_code, :branch => branch)
    end

    def find_or_create_leaf_part(code)
      reader = CodeReader.new(code)
      leaf = find_or_create_leaf(code, reader)
      leaf_part = reader.leaf_part
      leaf_part = '00' if leaf_part.blank?
      find_or_create(LeafPart, :code => leaf_part, :leaf => leaf)
    end

    def find_or_create_ingrowth_core(plot, core_num)
      find_or_create(IngrowthCore,
        plot: plot,
        ingrowth_core_num: core_num
      )
    end

    def self.ar_class
      raise NoMethodError
    end

end
