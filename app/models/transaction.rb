class Transaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :service

  validates :date, presence: true, date: true

  default_scope { order(created_at: :desc) }

  paginates_per 2
end
