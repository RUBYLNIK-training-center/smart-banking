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

  def self.transaction_creation_prohibited(sender, reciepent)
    redirect_to transactions_path, notice: 'Transaction failed' if sender.freeze == true && reciepent.freeze == true
  end

  def self.wallet_has_money(amount, quantity)
    amount > (quantity + 0.99)
  end
end
