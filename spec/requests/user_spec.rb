require 'rails_helper'

RSpec.describe '/users', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) do
    {
      id: '1',
      name: 'Test name',
      email: 'user@mail.ru',
      password: 'password',
      surname: 'Test surname',
      age: '25',
      phone_number: 'Test phone_number',
      passport_number: 'Test passport_number'
    }
  end

  before { user }

  describe 'GET /show' do
    context 'when an user was redirected to his profile' do
      it 'renders user profile', :aggregate_failures do
        get user_url(user, locale: :en)

        expect(response).to have_http_status(:ok)
        expect(response.body).to include(user.name)
        expect(response.body).to include('Your wallets:')
      end
    end
  end

  describe 'GET /edit' do
    context 'when an user was redirected to edit profile page' do
      it 'render the edit user page', :aggregate_failures do
        get edit_user_url(user, locale: :en)

        expect(response).to have_http_status(:ok)
        expect(response.body).to include('Editing')
        expect(response.body).to include('Update profile')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          id: 1,
          name: 'Test name',
          surname: 'Test surname',
          age: 25,
          phone_number: 'Test phone_number',
          passport_number: 'Test passport_number'
        }
      end

      it 'updates user attributes and redirects to user page', :aggregate_failures do
        expect do
          patch user_url(user, locale: :en), params: { user: new_attributes }
          user.reload
        end.to change(user, :name).to('Test name')
                                  .and change(user, :surname).to('Test surname')
                                                             .and change(user, :age).to 25

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(user_path(user))
      end
    end
  end
end
