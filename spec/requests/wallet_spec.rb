require 'rails_helper'

RSpec.describe '/wallets', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:wallet) { FactoryBot.create(:wallet) }

  let(:valid_attributes) do
    {
      id: '1',
      currency_id: '1',
      amount: '10',
      user_id: '1',
      locked: false,
      wallet_number: '7771895896655414'
    }
  end

  let(:invalid_attributes) do
    {
      id: '2',
      currency_id: '2',
      amount: '12',
      user_id: '3',
      locked: 'invalid parameter',
      wallet_number: '7771895896655414'
    }
  end

  before { wallet }

  describe 'POST /create' do
    let(:wallets) { [] }

    context 'with valid parameters' do
      it 'creates a new Wallet', :aggregate_failures do
        expect do
          post users_path, params: { wallet: valid_attributes }
          wallets.push(wallet)
        end.to change(wallets, :count).by(1)

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Wallet' do
        expect do
          post users_path, params: { wallet: invalid_attributes }
        end.to change(wallets, :count).by(0)
      end
    end
  end
end
