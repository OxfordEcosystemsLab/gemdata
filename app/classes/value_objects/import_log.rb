# Wrapper around the memory cache to keep track of import progress
class ImportLog

  attr_reader :import_id

  def initialize(import_id)
    @import_id = import_id
  end

  def <<(text)
    Rails.cache.write(@import_id, results << text)
  end

  def results
    Rails.cache.read(@import_id) || []
  end

  def self.get_results(import_id)
    ImportLog.new(import_id).results
  end

end
