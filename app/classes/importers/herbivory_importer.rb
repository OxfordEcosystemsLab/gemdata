class HerbivoryImporter < RowImporter

  def object
    @h
  end

  def read_row(values, logger)

    @h = find_or_new({
      :leaf => find_or_create_leaf(values[0] + '-' + values[1])
    })
    attempt_to_overwrite!(@h)
    @h.original_code = values[2]
    @h.date = Date.strptime(values[3], "%m/%d/%Y")
    @h.estimated_full_la = values[4]
    @h.observed_remaining_la = values[5]
    @h.consumed_la = values[6]
    @h.percent_consumed = values[7]
    @h.note = values[8]
    @h.quality_flag = values[9]
    save_with_status!
  end

private

  def self.ar_class
    Herbivory
  end
end

