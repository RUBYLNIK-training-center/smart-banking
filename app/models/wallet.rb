class Wallet < ApplicationRecord
  include WalletsHelpers

  before_create :set_wallet_number

  belongs_to :currency
  belongs_to :user

  has_many :transactions, dependent: :nullify

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  private

  def set_wallet_number
    created_wallet_number = WalletsHelpers.create_random_wallet_number

    if Wallet.exists?(wallet_number: created_wallet_number)
      set_wallet_number
    else
      self.wallet_number = created_wallet_number
    end
  end
end
