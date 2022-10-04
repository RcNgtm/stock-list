class Report < ApplicationRecord
  belongs_to :detail
  has_many :stocks
end
