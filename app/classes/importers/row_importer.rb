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

  def object
    raise NoMethodError
  end

  def read_row(values, logger)
    raise NoMethodError
  end

  protected

    def save_with_status!
      new     = object.new_record?
      changed = object.changed?
      saved   = object.save!

      if new
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

    def find_or_create_branch(code, reader = nil)

      if reader.nil?
        reader = CodeReader.new(code)
      end

      plot = Plot.where(:plot_code => reader.plot_code).first

      if plot.nil?
        raise Gemdata::PlotNotFound, "Plot with code '#{reader.plot_code}' does not exist"
      end

      tree = Tree.where(:tree_code => reader.tree_code).includes(:sub_plot).where('sub_plots.plot_id' => plot.id).first

      if tree.nil?
        raise Gemdata::TreeNotFound, "Tree with code '#{reader.tree_code}' does not exist in plot #{reader.plot_code}"
      end

      find_or_create(Branch, :code => reader.branch_code, :tree_id => tree.id)
    end

    def find_or_create_leaf(code)
      reader = CodeReader.new(code)
      branch = find_or_create_branch(code, reader)
      find_or_create(Leaf, :code => reader.suffix, :branch => branch)
    end

    def self.ar_class
      raise NoMethodError
    end

end

