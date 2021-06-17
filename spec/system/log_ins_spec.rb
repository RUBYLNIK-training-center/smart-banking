require 'rails_helper'

RSpec.describe 'LogIns', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { FactoryBot.create(:user) }

  context 'when email is invalid' do
    it 'is expected to show error to user' do
      visit new_user_session_path

      fill_in 'user_email', with: 'test@mail.com'
      fill_in 'user_password', with: 'password'

      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end

  context 'when password is invalid' do
    it 'is expected to show error to user' do
      visit new_user_session_path

      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: '123'

      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end

  context 'when user input is valid' do
    it 'is expected to log in user' do
      visit new_user_session_path

      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password

      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
