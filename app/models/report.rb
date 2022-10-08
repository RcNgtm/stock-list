class Report < ApplicationRecord
  belongs_to :detail
  has_many :stocks

  validates :product, presence: true
end
