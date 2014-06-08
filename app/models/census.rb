class Census < ActiveRecord::Base
  belongs_to :plot
  validates :mean_date, :number, :plot, :presence => true
  validates :mean_date, :uniqueness => {:scope => [:plot, :number]}
end
