module WalletMethods
  def create_random_wallet_number
    rand(1_111_111_111_111_111..9_999_999_999_999_999)
  end

  def currencies
    Currency.all
  end

  def unlocked_user_wallets(user)
    Wallet.where(user: user, locked: false)
  end
end
