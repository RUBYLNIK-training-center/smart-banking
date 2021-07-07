require 'rails_helper'

# def self.withdrawal_of_funds(sender_wallet, quantity)
# sender_wallet.amount = sender_wallet.amount - quantity.to_i - 0.99
# sender_wallet.save
# sender_wallet
#   end
#
#   def self.money_transfer(reciepent_wallet, quantity)
# reciepent_wallet.amount = reciepent_wallet.amount + quantity.to_i
# reciepent_wallet.save
# reciepent_wallet
#   end
#
#   def self.transaction_creation_prohibited(sender, reciepent)
# redirect_to transactions_path, notice: 'Transaction failed' if sender.freeze == true && reciepent.freeze == true
#   end

RSpec.describe TransactionsHelpers, type: :concern do
  include TransactionsHelpers

  let(:wallet) { FactoryBot.create(:wallet) }

  describe '.withdrawal_of_funds' do
    before do
      wallet.amount = 4
      TransactionsHelpers.withdrawal_of_funds(wallet, 1)
    end

    context 'is expected to have a withdrawal of funds from sender wallet' do
      it { expect(wallet.amount).to eq(0.201e1) }
    end
  end

  describe '.money_transfer' do
    before do
      wallet.amount = 4
      TransactionsHelpers.money_transfer(wallet, 1)
    end

    context 'is expected to have a money transfer on reciepent wallet' do
      it { expect(wallet.amount).to eq(0.5e1) }
    end
  end

  describe '.wallet_has_money' do
    before do
      wallet.amount = 2
    end

    context 'is expected to have a wallet has money' do
      it { expect(TransactionsHelpers.wallet_has_money(wallet.amount, 5)).to eq(false) }
    end
  end
end