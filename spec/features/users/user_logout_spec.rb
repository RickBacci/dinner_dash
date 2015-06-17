require 'rails_helper'

RSpec.describe User, type: :feature do
  it 'can logout of the site' do
    User.create(name: 'user',
                email_address: 'user@email.com',
                username: 'user',
                password: 'pass')

    visit login_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "pass"

    click_button "Login"

    expect(page).to have_content("Welcome, user")

    click_button "Logout"

    expect(page).to_not have_content ("Welcome, user")
  end
end
