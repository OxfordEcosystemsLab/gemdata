# Required the class to have a 'unique_key_columns' method that
# returns an array of columns that uniquely identify a record
module CSVImportTable

  extend ActiveSupport::Concern

  included do
    validates :quality_code, presence: true, inclusion: { in: Lookup::QualityCode.codes }
    validates :status, presence: true, inclusion: { in: Lookup::RowStatus.codes }
  end

  module ClassMethods

    def protected_attributes
      %w(id status created_at updated_at)
    end

    # Columns allowed in the CSV import
    def allowed_attributes
      self.new.attributes.keys.reject do |col|
        protected_attributes.include?(col)
      end
    end

    # Return a full hash of all unique keys for this table mapped to id
    def get_unique_keys_hash
      columns = unique_key_columns << :id
      Hash[select(columns).load.map { |r| [r.unique_key, r.id] }]
    end

    def table_human_name
      to_s.underscore.gsub('_',' ').capitalize
    end

  end

  # Get the unique key value for this table
  def unique_key
    key = []
    self.class.unique_key_columns.each do |col_name|
      key << self.send(col_name) || '-'
    end
    key.join
  end

end
