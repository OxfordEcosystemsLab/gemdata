# Required the class to have the following methods
#
#   unique_key_columns
#     returns an array of columns that uniquely identify a record
#
#   read_row
#     takes a CSV row and returns an import status
#
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

  def self.read_row(row)

    # Swap NaN & NA values for blanks
    row_hash = row.to_hash
    row_hash.map { |k,v| row_hash[k] = (v == 'NaN' ? nil : v) }
    row_hash.map { |k,v| row_hash[k] = (v == 'NA' ? nil : v) }

    # Remove protected attributes
    @ar_class.protected_attributes.each { |col| row_hash.delete(col) }

    # Report blank headings
    if $. == 2 && row_hash.keys.any? { |k| k.blank? }
      raise "You have a blank column heading :-("
    end

    # Jump to next row if blank
    if row_hash.blank?
      put_message "Row #{$.} skipped - empty row"
      skipped += 1
      next
    end

    # Create the AR object and validate
    new_record = @ar_class.new(row_hash)
    new_record.status = Lookup::RowStatus.imported
    new_record.quality_code ||= Lookup::QualityCode.ok

    # Record not valid: log the error
    unless new_record.valid?
      validation_errors = new_record.errors.messages.map { |k,v| "#{k} #{v.first}" }.join(", ")
      put_message "Row #{$.} failed - #{validation_errors}"
      failed += 1
      next
    end

    # Check for an existing record
    existing_record_id = current_keys[new_record.unique_key]
    if existing_record_id

      # Update existing
      existing = @ar_class.find_by(id: existing_record_id)
      existing.attributes = row_hash
      if existing.changed?
        if existing.status == Lookup::RowStatus.imported
          existing.save
          updated += 1
        else
          put_message "Row #{$.} skipped - status of existing row (id:#{existing.id}) isn't 'imported'"
          skipped += 1
        end
      else
        ignored += 1
      end

    else

      # Insert new row
      new_record.save
      inserted += 1

    end
  end

end
