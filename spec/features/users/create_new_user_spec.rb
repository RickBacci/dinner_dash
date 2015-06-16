require 'rails_helper'

RSpec.describe User, type: :feature do
  it 'registers for the site' do
    visit new_user_path

    fill_in "Name", with: "user"
    fill_in "Email address", with: "email@address.com"
    fill_in "Username", with: "username"
    fill_in "Password", with: "pass"

    click_button "Create User"

    expect(page).to have_content("Welcome, user")
  end
end
