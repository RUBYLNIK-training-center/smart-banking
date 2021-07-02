module WalletsHelpers
  def self.create_random_wallet_number
    rand(1_111_111_111_111_111..9_999_999_999_999_999)
  end

  def self.currencies
    Currency.all
  end

  def self.unlocked_user_wallets(user)
    Wallet.where(user: user, locked: false)
  end
end
