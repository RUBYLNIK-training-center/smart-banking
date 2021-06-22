require 'rails_helper'

RSpec.describe '/users', type: :request do
  let(:valid_attributes) do
    {
      'id' => '1',
      'name' => 'Test name',
      'email' => 'user@mail.ru',
      'password' => 'password',
      'surname' => 'Test surname',
      'age' => '25',
      'phone_number' => 'Test phone_number',
      'passport_number' => 'Test passport_number'
    }
  end
  
  let(:invalid_attributes) do
    {
      'id' => '1',
      'name' => 'Te21st name',
      'surname' => 'Test surname',
      'age' => 'qwqq',
      'phone_number' => 'Test pho11ne_number',
      'passport_number' => 'Test passport_number'
    }
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          'id' => '1',
          'name' => 'Test name',
          'surname' => 'Test surname',
          'age' => '25',
          'phone_number' => 'Test phone_number',
          'passport_number' => 'Test passport_number'
        }
      end

      it 'updates the requested post' do
        user = User.new(valid_attributes)
        user.save
        patch user_url(user), params: { user: new_attributes }
        user.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the post' do
        user = User.new(valid_attributes)
        user.save
        patch user_url(user), params: { user: new_attributes }
        user.reload
        expect(response).to redirect_to(user_url(user))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end