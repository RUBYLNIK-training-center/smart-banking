class Wallet < ApplicationRecord
  belongs_to :currency
  belongs_to :user
  has_many :transactions
end
