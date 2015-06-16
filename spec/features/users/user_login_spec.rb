require 'rails_helper'

RSpec.describe User, type: :feature do
  it 'should let a registered user login to the site' do

    user = User.create(username: "user",
                       password: "pass")

    visit login_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "pass"

    click_button "Login"

    expect(page).to have_content("Welcome, user")
  end
end
