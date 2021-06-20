require 'rails_helper'

RSpec.describe 'Registrations', type: :system do
  before { driven_by(:rack_test) }

  let(:user) { FactoryBot.create(:user) }

  context 'when email has already been taken' do
    it 'is expected to show error to user' do
      visit new_user_registration_path

      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: '123'
      fill_in 'user_password_confirmation', with: '222'

      click_button 'Register now'
      expect(page).to have_content 'Email has already been taken'
    end
  end

  context "when password confirmation doesn't match password" do
    it 'is expected to show error to user' do
      visit new_user_registration_path

      fill_in 'user_email', with: 'test@mail.com'
      fill_in 'user_password', with: '123'
      fill_in 'user_password_confirmation', with: '222'

      click_button 'Register now'
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end

  context 'when password is too short' do
    it 'is expected to show error to user' do
      visit new_user_registration_path

      fill_in 'user_email', with: 'test@mail.com'
      fill_in 'user_password', with: '123'
      fill_in 'user_password_confirmation', with: '123'

      click_button 'Register now'
      expect(page).to have_content 'Password is too short'
    end
  end
end
