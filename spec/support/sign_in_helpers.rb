module SignInHelpers

  def sign_in_as(user)
    user
    visit '/login'
    fill_in "Username", with: user.name
    fill_in "Password", with: user.password
    click_button "Login"
  end

  def valid_attributes
    {
      name: 'user',
      email_address: 'user@site.com',
      username: 'user',
      password: 'user',
      role: 0
    }
  end

  def user
    User.new(
      name: 'user',
      email_address: 'user@site.com',
      username: 'user',
      password: 'password',
      role: 0)
  end

  def admin
    User.create(
      name: 'admin',
      email_address: 'admin@site.com',
      username: 'admin',
      password: 'password',
      role: 1)
  end

  def jeff
    User.create(
      name: "Jeff Casimir",
      email_address: "demo+jeff@jumpstartlab.com",
      username: "j3",
      password: "password")
  end

  def rachel
    User.create(
      name: "Rachel Warbelow",
      email_address: "demo+rachel@jumpstartlab.com",
      password: "password",
      username: nil)
  end
end
