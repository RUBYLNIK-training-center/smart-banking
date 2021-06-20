class Wallet < ApplicationRecord
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :currency
  belongs_to :user
  has_many :transactions, dependent: :destroy
end
