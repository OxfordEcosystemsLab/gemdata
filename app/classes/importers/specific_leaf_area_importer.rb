class SpecificLeafAreaImporter < RowImporter

  def object
    @sla
  end

  def read_row(values, logger)
    @sla = find_or_new({
      :leaf => find_or_create_leaf(values[0])
    })
    attempt_to_overwrite!(@sla)
    @sla.lamina_area = values[2]
    @sla.lamina_drymass = values[3] unless values[3] == 'NA'
    @sla.laminapetiole_area = values[4] unless values[4] == 'NA'
    @sla.laminapetiole_drymass = values[5] unless values[5] == 'NA'
    @sla.comment = values[6]
    @sla.quality_flag = values[7]
    @sla.sla_lamina = values[8]
    @sla.sla_lamina_petiole = values[9] unless values[9] == 'NA'
    @sla.lma_lamina = values[10]
    @sla.lma_lamina_petiole = values[11] unless values[11] == 'NA'
    save_with_status!
  end

  private

    def self.ar_class
      SpecificLeafArea
    end

end
