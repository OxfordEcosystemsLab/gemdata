class IngrowthCoreValues < ActiveRecord::Base

  validates :plot_code, presence: true, format: /\A[A-Z]{3}-\d{2}\z/
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1983, less_than_or_equal_to: 2099 }
  validates :month, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
  validates :day, allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }
  validates :ingrowth_core_number, presence: true, numericality: { only_integer: true }
  validates :time_step, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }
  validates :ingrowth_core_litterfall_g, allow_nil: true, numericality: true
  validates :soil_humidity_pcnt, allow_nil: true, numericality: true
  validates :soil_temperature_c, allow_nil: true, numericality: true
  validates :ol_under_2mm_g, allow_nil: true, numericality: true
  validates :ml_under_2mm_g, allow_nil: true, numericality: true

  def self.unique_key_columns
    [:plot_code, :year, :month, :day, :ingrowth_core_number, :time_step]
  end

  def self.get_unique_keys_hash
    columns = unique_key_columns << :id
    Hash[select(columns).load.map { |r| [r.unique_key, r.id] }]
    # unique_key = ar_class.unique_key_columns.map { |c| "COALESCE(CAST(#{c} AS TEXT), '-')" }.join(" || ")
    # current_keys_raw = ar_class.connection.select_rows("SELECT #{unique_key}, id FROM #{ar_class.to_s.tableize}")
    # current_keys = Hash[current_keys_raw]
  end

  def unique_key
    key = []
    IngrowthCoreValues.unique_key_columns.each do |col_name|
      key << self.send(col_name) || '-'
    end
    key.join
  end

end
