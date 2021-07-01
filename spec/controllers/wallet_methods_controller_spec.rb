describe WalletMethodsConcern do
  let(:user) { FactoryBot.create(:user) }
  let(:object) { FakesController.new }
  let(:wallet) { FactoryBot.create(:wallet) }

  before do
    class FakesController < ApplicationController
      include WalletMethods
    end
  end

  it 'unlocked_user_wallets' do
    value = unlocked_user_wallets(user)
    expect(value).to eq(false)
  end
end
