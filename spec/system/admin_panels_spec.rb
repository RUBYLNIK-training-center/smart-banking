require 'rails_helper'

RSpec.describe 'AdminPanels', type: :system do
  before { driven_by(:rack_test) }

  login_admin_user

  context 'when admin is logged in' do
    it 'is expected to see Users page' do
      expect(page).to have_content 'Users'
    end

    it 'is expected to see News page' do
      expect(page).to have_content 'Posts'
    end
  end

  context 'when admin clicks Users page' do
    it 'is expected to see user filters' do
      visit admin_users_path
      expect(page).to have_content 'Filters'
    end
  end

  context 'when admin clicks show user' do
    let(:user) { FactoryBot.create(:user) }

    it 'is expected to see user information' do
      visit admin_user_path(user)
      expect(page).to have_content user.email
    end
  end
end
