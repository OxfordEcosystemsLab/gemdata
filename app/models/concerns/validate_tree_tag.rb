module ValidateTreeTag

  extend ActiveSupport::Concern

  included do
    # 1-4 digits followed by optional dot and a single digit
    validates :tree_tag, presence: true, format: { with: /\A\d{1,4}(\.\d)?\z/, message: "should be in format 123[.1]" }
  end

end
