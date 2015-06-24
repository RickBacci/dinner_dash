module SignUpHelpers
  def sign_up_with(
    name: "user",
    email_address: "user",
    username: "user",
    password: "password"
  )
    visit new_user_path

    fill_in "Name", with: name
    fill_in "Email", with: email_address
    fill_in "Username", with: username
    fill_in "Password", with: password

    click_button "Create User"
  end
end

