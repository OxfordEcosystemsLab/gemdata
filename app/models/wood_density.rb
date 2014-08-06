require 'csv'

class WoodDensity < ActiveRecord::Base
  belongs_to :branch

  validates :branch, presence: true
  validates :date, presence: true
  validates :evaluator, presence: true
  validates :volume, presence: true, numericality: {greater_than: 0}

  validates :branch_number, presence: true, format: {
    with: /[SC]C[123]/, message: 'Should be SC or CC followed by 1, 2 or 3'
  }

end
