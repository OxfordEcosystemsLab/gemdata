class Lookup
  extend Lookups

  define_lookup "RowStatus", %w(imported updated)
  define_lookup "QualityCode", %w(ok)

end
