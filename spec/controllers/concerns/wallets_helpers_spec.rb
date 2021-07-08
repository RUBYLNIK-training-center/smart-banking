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
end
