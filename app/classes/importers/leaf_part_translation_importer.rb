class LeafPartTranslationImporter < RowImporter

  def object
    @pt
  end

  def read_row(values, logger)
    @pt = LeafPartTranslation.new
    @pt.original_suffix = values[0] == nil ? '' : values[0]
    @pt.part = values[1]
    @pt.subsection = values[2]
    @pt.simple_or_compound = values[3]
    @pt.ar_class = values[4]
    save_with_status!
  end

  private

    def self.ar_class
      LeafPartTranslation
    end

end
