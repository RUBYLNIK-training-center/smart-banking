class Transaction < ApplicationRecord
  validates :date, presence: true

  belongs_to :wallet
end
