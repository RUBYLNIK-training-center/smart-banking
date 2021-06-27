module WalletFunc
  def create_random_wallet_number
    rand(1...3)
  end

  def currencies
    Currency.all
  end
end
