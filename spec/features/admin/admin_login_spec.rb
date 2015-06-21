require 'rails_helper'

describe User, type: :feature do
  include SignInHelpers

  it 'should be able to login as an admin and see Admin Dashboard button' do
    sign_in_as(admin)

    visit root_path

    expect(admin.email_address).to eq('admin@site.com')
    expect(page).to have_button('Admin Dashboard')
  end

  it 'should not allow a regular user to see admin functionality' do
    sign_in_as(user)

    visit root_path

    expect(page).to_not have_button('Admin Dashboard')
  end
end

