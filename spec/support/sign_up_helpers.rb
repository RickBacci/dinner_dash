module SignUpHelpers
  def sign_up_with(attributes)
   name = attributes[:name].nil? ? nil : attributes[:name] || 'user'
   email_address = attributes[:email_address].nil? ? nil : attributes[:email_address] || 'user'
   username = attributes[:username].nil? ? nil : attributes[:username] || 'user'
   password = attributes[:password].nil? ? nil : attributes[:password] || 'password'

    visit new_user_path

    fill_in "Name", with: name
    fill_in "Email", with: email_address
    fill_in "Username", with: username
    fill_in "Password", with: password

    click_button "Create User"
  end
end

