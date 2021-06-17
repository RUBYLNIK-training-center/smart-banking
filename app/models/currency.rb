class Currency < ApplicationRecord
  validates :rate, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :wallet
end
