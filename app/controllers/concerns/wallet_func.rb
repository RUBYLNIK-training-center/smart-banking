module WalletFunc
  def create_random_wallet_number
    rand(1_111_111_111_111_111..9_999_999_999_999_999)
  end

  def currencies
    Currency.all
  end

  def unlocked_user_wallets(user)
    wallets = []

    user.wallets.each do |wallet|
      wallets << wallet if wallet.locked == false
    end
    wallets
  end
end
