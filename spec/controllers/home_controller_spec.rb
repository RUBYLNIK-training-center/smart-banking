require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    context 'when user is loggged in' do
      login_user

      it 'is expected to have a current_user' do
        expect(subject.current_user).not_to eq(nil)
      end
    end
  end
end
