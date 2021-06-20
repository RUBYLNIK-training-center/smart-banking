class Transaction < ApplicationRecord
  validates :date, presence: true, date: true

  belongs_to :wallet
end
