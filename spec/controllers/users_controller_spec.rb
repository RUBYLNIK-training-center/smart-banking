require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /show' do
    context 'when user is not logged in' do
      login_user

      it 'is expected not to have a current_user' do
        expect(subject.current_user).not_to eq(nil)
      end
    end
  end
end
