module SystemMacros
  def login_admin_user
    before do
      admin_user = FactoryBot.create(:admin_user)

      visit new_admin_user_session_path

      fill_in 'admin_user_email', with: admin_user.email
      fill_in 'admin_user_password', with: admin_user.password

      click_button 'Login'
    end
  end
end
