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
  include described_class

  let(:wallet) { FactoryBot.create(:wallet) }

  describe '.withdrawal_of_funds' do
    before do
      wallet.amount = 4
      described_class.withdrawal_of_funds(wallet, 1)
    end

    context 'when expected to have a withdrawal of funds from sender wallet' do
      it { expect(wallet.amount).to eq(0.201e1) }
    end
  end

  describe '.money_transfer' do
    before do
      wallet.amount = 4
      described_class.money_transfer(wallet, 1)
    end

    context 'when expected to have a money transfer on reciepent wallet' do
      it { expect(wallet.amount).to eq(0.5e1) }
    end
  end

  describe '.wallet_has_money' do
    before do
      wallet.amount = 2
    end

    context 'when expected to have a wallet has money' do
      it { expect(described_class.wallet_has_money(wallet.amount, 5)).to eq(false) }
    end
  end

  describe '.find_by_service_or_wallet_number' do
    let(:wallet) { described_class.find_by_service_or_wallet_number(1, nil) }
    let(:wallet2) { described_class.find_by_service_or_wallet_number(nil, 7_771_895_896_655_414) }

    context 'when service was passed' do
      it { expect(wallet).to eq(Wallet.find_by_service_id(1)) }
    end

    context 'when wallet number was passed' do
      it { expect(wallet2).to eq(Wallet.find_by_service_id(7_771_895_896_655_414)) }
    end
  end

  describe '.service' do
    context 'when service was found' do
      it { expect(described_class.service(5)).to eq(Service.find(5)) }
    end

    context 'when service was not found' do
      it { expect(described_class.service(nil)).to eq(nil) }
    end
  end
end
