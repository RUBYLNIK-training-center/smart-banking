require 'rails_helper'
require 'pry'

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

  describe 'GET /edit' do
    context 'when an user was redirected to edit profile page' do
      it 'render the edit user page', :aggregate_failures do
        get edit_users_url
        expect(response).to have_http_status(:found)
        expect(response.body).to include('redirected')
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
          patch users_url
          user.update(name: new_attributes[:name], surname: new_attributes[:surname], age: new_attributes[:age])
          user.reload
        end.to change(user, :name).to('Test name')
                                  .and change(user, :surname).to('Test surname')
                                                             .and change(user, :age).to 25
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
