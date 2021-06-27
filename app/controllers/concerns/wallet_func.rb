module WalletFunc
  def create_random_wallet_number
    rand(324_324_113...999_999_999)
  end

  def iban
    'CY 17 002 00128 00000012005276002﻿'
  end

  def currencies
    Currency.all
  end
end
