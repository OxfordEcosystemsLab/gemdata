class Lookup
  extend Lookups

  define_lookup "RowStatus", %w(imported updated)
  define_lookup "ImportStatus", %w(updated skipped ignored inserted failed)
  define_lookup "QualityCode", %w(ok)

end
