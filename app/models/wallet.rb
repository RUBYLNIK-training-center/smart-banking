class Wallet < ApplicationRecord
  before_create :set_wallet_number

  belongs_to :currency
  belongs_to :user

  has_many :transactions, dependent: :nullify

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def set_wallet_number
    if Wallet.exists?(wallet_number: generate_wallet_number)
      set_wallet_number
    else
      self.wallet_number = number
    end
  end

  private

  def generate_wallet_number
    rand(1_111_111_111_111_111..9_999_999_999_999_999)
  end
end
