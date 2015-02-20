class SpectraMeasurementImporter < RowImporter

  def object
    @sm
  end

  def read_row(values, logger)
    # The leaf part code translation should just happen by magic
    # Just make sure the translation table is loaded before you do
    # this import

    @sm = find_or_new({
      leaf_part: find_or_create_leaf_part(values[3].gsub(/\s/, '')),
      measurement_type: values[0].downcase.gsub(/\s/, '').gsub('-', '_')
    })
    attempt_to_overwrite!(@sm)    
    @sm.matlab_branch_code = values[1].gsub(/'/, '')
    @sm.original_code = values[3]
    @sm.branch_number = values[4]
    @sm.leaf_number = values[5]
    @sm.comments = values[6]
    @sm.quality_check = values[7]
    (350..1100).each do |n|
      @sm.send("measurement_#{n}=", values[n - 350 + 8])
    end
    save_with_status!
  end

  def self.ar_class
    SpectraMeasurement
  end

end
