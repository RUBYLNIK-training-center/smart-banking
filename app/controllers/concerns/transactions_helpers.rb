module TransactionsHelpers
  def self.withdrawal_of_funds(sender_wallet, quantity)
    sender_wallet.amount = sender_wallet.amount - quantity.to_i - 0.99
    sender_wallet.save
    sender_wallet
  end

  def self.money_transfer(reciepent_wallet, quantity)
    reciepent_wallet.amount = reciepent_wallet.amount + quantity.to_i
    reciepent_wallet.save
    reciepent_wallet
  end

  def self.wallet_has_money(amount, quantity)
    amount > (quantity + 0.99)
  end
  
    def self.service(service_id)
    Service.find(service_id) unless service_id.nil?
  end

  def self.find_by_service_or_wallet_number(service_id, wallet_number)
    if service_id.nil?
      Wallet.find_by_wallet_number(wallet_number)
    else
      Wallet.find_by_service_id(service_id.to_i)
    end
  end
end
