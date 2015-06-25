require 'rails_helper'

describe User, type: :feature do
  include SignUpHelpers

  it 'should let a registered user login to the site' do
    User.create(name: 'name',
                email_address: 'what@ever.com',
                username: 'user',
                password: 'pass')

    visit login_path

    fill_in 'Username', with: 'user'
    fill_in 'Password', with: 'pass'

    click_button 'Login'

    expect(page).to have_content('Logout')
    expect(page).to_not have_content('Login')
  end

  it 'gets a descriptive error message for no name' do
    sign_up_with(name: nil)

    expect(page).to have_content("Name can't be blank")
  end

  it 'gets a descriptive error message for no email address' do
    sign_up_with(email_address: nil)

    expect(page).to have_content("Email address can't be blank")
  end

  it 'gets a descriptive error message for an invalid email address' do
    sign_up_with(email_address: 'invalid_email')

    expect(page).to have_content('Email address is invalid')
  end
  it 'gets a descriptive error message for no password' do
    sign_up_with(password: nil)

    expect(page).to have_content("Password can't be blank")
  end

  it 'gets a descriptive error message for username being too short' do
    sign_up_with(username: 'x')
    too_short = 'Username is too short (minimum is 2 characters)'

    expect(page).to have_content(too_short)
  end

  it 'gets a descriptive error message for username being too long' do
    sign_up_with(username: 'x' * 33)
    too_long = 'Username is too long (maximum is 32 characters)'

    expect(page).to have_content(too_long)
  end
end
