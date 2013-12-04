module ValidatePlotAndDate

  extend ActiveSupport::Concern

  included do
    # 2 uppercase letters, a hyphen, then 2 digits
    validates :plot_code, presence: true, format: { with: /\A[A-Z]{3}-\d{2}\z/, message: "should be in format ABC-01" }
    validates :year,      presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1983, less_than_or_equal_to: 2099 }
    validates :month,     presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
    begin
      if connection.column_exists?(self.name.tableize, :day)
        validates :day,     allow_nil: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }
      end
    rescue
      # Hack fix: Trips up migrations in production
      raise unless Rails.env.production?
    end
  end

end
