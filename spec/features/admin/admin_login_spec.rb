require 'rails_helper'

RSpec.describe User, type: :feature do
  it 'should be able to login as an admin and see Admin Dashboard button' do
    admin = User.new(name: 'admin',
                     email_address: 'admin@site.com',
                     username: 'admin',
                     password: 'admin',
                     role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit root_path

    expect(admin.email_address).to eq('admin@site.com')
    expect(page).to have_button('Admin Dashboard')
  end

  it 'should not allow a regular user to see admin functionality' do
    user = User.new(name: 'user',
                     email_address: 'user@site.com',
                     username: 'user',
                     password: 'user',
                     role: 0)

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(user)

    visit root_path

    expect(page).to_not have_content('Admin Dashboard')
  end
end

