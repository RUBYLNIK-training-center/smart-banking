require 'rails_helper'

RSpec.describe WalletsHelpers, type: :concern do
  include WalletsHelpers

  let(:wallet) { FactoryBot.create(:wallet) }

  describe '.create_random_wallet_number' do
    let(:random_wallet_number) { WalletsHelpers.create_random_wallet_number }
    let(:random) { rand(1_111_111_111_111_111..9_999_999_999_999_999) }

    context 'is expected to have an unlocked wallets' do
      it { expect(random_wallet_number.to_s.length).to eq(random.to_s.length) }
    end
  end

  describe '.unlocked_user_wallets' do
    let(:user) { FactoryBot.create(:user) }
    let(:unlocked_wallets) { WalletsHelpers.unlocked_user_wallets(user) }
    let(:first_wallet) { FactoryBot.create(:wallet) }
    let(:second_wallet) { FactoryBot.create(:wallet) }

    before do
      user.wallets.push(first_wallet)

      second_wallet.locked = true
      user.wallets.push(second_wallet)
    end

    context 'is expected to have an unlocked wallets' do
      it { expect(unlocked_wallets.first.locked).to eq(false) }
      it { expect(unlocked_wallets.length).to eq(1) }
    end
  end

  describe '.currencies' do
    let(:currencies) { WalletsHelpers.currencies }

    context 'is expected to have all currencies' do
      it { expect(currencies).to eq(Currency.all) }
      it { expect(currencies.length).to eq(Currency.all.length) }
    end
  end

  describe '.freeze_wallet' do
    before do
      WalletsHelpers.freeze_wallet(wallet)
      wallet
    end

    context 'is expected to have frozen wallet' do
      it { expect(wallet.freeze).to eq(true) }
    end
  end

  describe '.unfreeze' do
    before do
      WalletsHelpers.unfreeze(wallet)
      wallet
    end

    context 'is expected to have frozen wallet' do
      it { expect(wallet.freeze).to eq(false) }
    end
  end
end
