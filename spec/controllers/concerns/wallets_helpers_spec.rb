require 'rails_helper'

RSpec.describe WalletsHelpers, type: :concern do
  include described_class

  let(:wallet) { FactoryBot.create(:wallet) }

  describe '.create_random_wallet_number' do
    let(:random_wallet_number) { described_class.create_random_wallet_number }
    let(:random) { rand(1_111_111_111_111_111..9_999_999_999_999_999) }

    context 'when expected to have an unlocked wallets' do
      it { expect(random_wallet_number.to_s.length).to eq(random.to_s.length) }
    end
  end

  describe '.currencies' do
    let(:currencies) { described_class.currencies }

    context 'when expected to have all currencies' do
      it { expect(currencies).to eq(Currency.all) }
      it { expect(currencies.length).to eq(Currency.all.length) }
    end
  end

  describe '.freeze!' do
    before do
      wallet.freeze!
      wallet
    end

    context 'when expected to have frozen wallet' do
      it { expect(wallet.freeze).to eq(true) }
    end
  end

  describe '.unfreeze!' do
    before do
      wallet.unfreeze!
      wallet
    end

    context 'when expected to have frozen wallet' do
      it { expect(wallet.freeze).to eq(false) }
    end
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

  describe '.currency_convertation' do
    let(:wallet2) { FactoryBot.create(:wallet) }
    let(:wallet3) { FactoryBot.create(:wallet) }

    before do
      usd = Currency.create(name: 'USD', rate: '1.000000')
      wallet.currency =  Currency.create(name: 'BYN', rate: '2.530000')
      wallet2.currency = usd
      wallet3.currency = usd
    end

    context 'when currencies are different' do
      it { expect(described_class.currency_convertation(wallet2, wallet, 1)).to eq(2.53) }
    end

    context 'when currencies are the same' do
      it { expect(described_class.currency_convertation(wallet2, wallet3, 1)).to eq(1) }
    end
  end
end
