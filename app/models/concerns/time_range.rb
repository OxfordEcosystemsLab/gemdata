module TimeRange
  extend ActiveSupport::Concern

  included do
    validates :start,  :presence => true
    validates :finish, :presence => true
  end

  module ClassMethods

    def find_by_time time
      self.where("start < ? AND finish > ?", time, time).first
    end
  end

end
