module WalletsHelpers
  def self.create_random_wallet_number
    rand(1_111_111_111_111_111..9_999_999_999_999_999)
  end

  def self.currencies
    Currency.all
  end

  def self.currency_convertation(sender_wallet, reciepent_wallet, sum)
    if sender_wallet.currency == reciepent_wallet.currency
      sum
    else
      rate = sender_wallet.currency.rate
      usd = sum.to_f / rate
      reciepent_wallet.currency.rate * usd
    end
  end

  def freeze!
    update(freeze: true)
  end

  def unfreeze!
    update(freeze: false)
  end
end
