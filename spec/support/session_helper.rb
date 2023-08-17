def sign_up
    visit new_user_registration_path

    fill_in :user_email, :with => 'testuser@example.com'
    fill_in :user_username, :with => 'testusername'
    fill_in :user_password, :with => 'secure123!@#333'
    fill_in :user_password_confirmation, :with => 'secure123!@#333'

    click_button 'Sign up'
end

