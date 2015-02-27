class SpecificLeafAreaImporter < RowImporter

  def object
    @sla
  end

  def read_row(values, logger)
    @sla = find_or_new({
      :leaf => find_or_create_leaf(values[0])
    })
    attempt_to_overwrite!(@sla)
    @sla.lamina_area = values[2] unless values[2].upcase == 'NA'
    @sla.lamina_drymass = values[3] unless values[3].upcase == 'NA'
    @sla.laminapetiole_area = values[4] unless values[4].upcase == 'NA'
    @sla.laminapetiole_drymass = values[5] unless values[5].upcase == 'NA'
    @sla.comment = values[6]
    @sla.quality_flag = values[7]
    @sla.sla_lamina = values[8] unless values[8].upcase == 'NA'
    @sla.sla_lamina_petiole = values[9] unless values[9].upcase == 'NA'
    @sla.lma_lamina = values[10] unless values[10].upcase == 'NA'
    @sla.lma_lamina_petiole = values[11] unless values[11].upcase == 'NA'
    save_with_status!
  end

  private

    def self.ar_class
      SpecificLeafArea
    end

end
