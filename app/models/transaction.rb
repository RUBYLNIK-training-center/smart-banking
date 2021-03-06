class Transaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :service, optional: true
  belongs_to :user

  validates :date, presence: true, date: true
  validates :sum, presence: true, numericality: { greater_than: 0 }
  validates :fee, presence: true, numericality: { greater_than_or_equal_to: 0 }

  default_scope { order(created_at: :desc) }

  paginates_per 2

  def receipt
    Receipts::ReceiptGenerator.new(self).call
  end
end
