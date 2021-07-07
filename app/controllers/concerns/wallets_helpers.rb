module WalletsHelpers
  def self.create_random_wallet_number
    rand(1_111_111_111_111_111..9_999_999_999_999_999)
  end

  def self.currencies
    Currency.all
  end

  def freeze_wallet!
    self.freeze = true
    save
    self
  end

  def unfreeze!
    self.freeze = false
    save
    self
  end
end
