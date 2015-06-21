module SignInHelpers
  def sign_in_as(user)
    visit login_path
    fill_in "Username", with: user.name
    fill_in "Password", with: user.password
    within("form") do
      click_on "Login"
    end
  end

  def user
    User.new(
      name: 'user',
      email_address: 'user@site.com',
      username: 'user',
      password: 'user',
      role: 0)
  end

  def admin
    User.create(
      name: 'admin',
      email_address: 'admin@site.com',
      username: 'admin',
      password: 'admin',
      role: 1)
  end

  def jeff
    User.create(
      name: "Jeff Casimir",
      email_address: "demo+jeff@jumpstartlab.com",
      username: "j3",
      password: "password")
  end
end
