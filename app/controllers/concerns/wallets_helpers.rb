module WalletsHelpers
  def self.create_random_wallet_number
    rand(1_111_111_111_111_111..9_999_999_999_999_999)
  end

  def self.currencies
    Currency.all
  end

  def freeze!
    self.freeze = true
    save
    self
  end

  def unfreeze!
    update(freeze: false)
  end
end
