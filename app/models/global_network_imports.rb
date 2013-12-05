class GlobalNetworkImports < ActiveRecord::Base

  include CSVImportTable

  validates :global_region_code, presence: true
  validates :region_code, presence: true
  validates :country_code, presence: true
  validates :site_code, presence: true
  validates :plot_code, presence: true, format: { with: /\A[A-Z]{3}-\d{2}\z/, message: "should be in format ABC-01" }

  def self.unique_key_columns
    [:plot_code]
  end

end
