class Wallet < ApplicationRecord
  belongs_to :currency
  belongs_to :user

  has_many :transactions, dependent: :nullify

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
