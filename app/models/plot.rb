class Plot < ActiveRecord::Base
  validates :plot_code, presence: true

  def plot_code=(code)
    write_attribute(:plot_code, code.gsub(/-/, ''))
  end
end
