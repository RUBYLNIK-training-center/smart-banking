class Transaction < ApplicationRecord
  belongs_to :wallet

  validates :date, presence: true, date: true
end
