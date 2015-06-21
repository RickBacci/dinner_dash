module SignInHelpers
  def sign_in_as(user)
    visit login_path
    fill_in "Username", with: user.name
    fill_in "Password", with: user.password
    within("form") do
      click_on "Login"
    end
  end
end
