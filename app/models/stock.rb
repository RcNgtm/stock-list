class Stock < ApplicationRecord
  belongs_to :report
  belongs_to :user

  validates :movedate, presence: true
  validates :num, presence: true, numericality: { only_integer: true }
end
