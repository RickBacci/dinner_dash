# When I visit the new user page ‘/user/new'
# I fill out a form with my Username, and Password
# And click on ‘Create New User’
# I’m re-directed to my show page
# And I expect to see my username

require 'rails_helper'

RSpec.describe User, type: :feature do
  it 'registers for the site' do
    visit new_user_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "pass"

    click_button "Create User"

    expect(page).to have_content("Welcome, user")
  end
end
